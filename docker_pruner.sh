#!/bin/bash

# Function to print messages with colors
echo_step() {
    echo -e "\n\033[1;34m$1\033[0m"  # Blue for steps
}

echo_info() {
    echo -e "\033[1;32m$1\033[0m"    # Green for success/info
}

echo_warn() {
    echo -e "\033[1;33m$1\033[0m"    # Yellow for warnings
}

echo_error() {
    echo -e "\033[1;31m$1\033[0m"    # Red for errors
}

echo_info "🚀 Starting Docker environment reset script..."

# Step 1: Stop all running containers
echo_step "Step 1: Stop all running containers..."
if docker stop $(docker ps -q) 2>/dev/null; then
    echo_info "✅ All running containers stopped."
else
    echo_warn "⚠️  No running containers to stop."
fi

# Step 2: Remove all containers
echo_step "Step 2: Remove all containers..."
if docker rm $(docker ps -aq) 2>/dev/null; then
    echo_info "✅ All containers removed."
else
    echo_warn "⚠️  No containers to remove."
fi

# Step 3: Remove all images
echo_step "Step 3: Remove all images..."
if docker rmi $(docker images -q) -f 2>/dev/null; then
    echo_info "✅ All images removed."
else
    echo_warn "⚠️  No images to remove."
fi

# Step 4: Option to remove all volumes
read -p "❓ Do you want to remove all volumes? (y/n): " remove_volumes
if [[ "$remove_volumes" =~ ^[yY]$ ]]; then
    echo_step "Step 4: Remove all volumes..."
    if docker volume rm $(docker volume ls -q) 2>/dev/null; then
        echo_info "✅ All volumes removed."
    else
        echo_warn "⚠️  No volumes to remove."
    fi
else
    echo_warn "⚠️  Skipping volume removal."
fi

# Step 5: Option to remove all networks
read -p "❓ Do you want to remove all networks? (y/n): " remove_networks
if [[ "$remove_networks" =~ ^[yY]$ ]]; then
    echo_step "Step 5: Remove all networks..."
    if docker network rm $(docker network ls -q) 2>/dev/null; then
        echo_info "✅ All networks removed."
    else
        echo_warn "⚠️  No networks to remove."
    fi
else
    echo_warn "⚠️  Skipping network removal."
fi

# Step 6: Clean up system
echo_step "Step 6: Clean up system..."
if docker system prune -af --volumes 2>/dev/null; then
    echo_info "✅ Docker system cleaned up."
else
    echo_error "❌ Failed to clean up Docker system."
fi

echo_info "🎉 Docker reset complete!"
