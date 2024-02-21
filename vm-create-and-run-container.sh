#!/bin/bash

container_name="vm-database-container"
image_name="vm-dababase-image:latest"

# Check if the container exists (either running or stopped)
container_status=$(docker ps -a -f name="$container_name"  --format '{{.Names}}' | grep -w "$container_name")

if [ ! -z "$container_status" ]; then
    echo "Stopping "$container_name"..."
    docker stop "$container_name"

    # Remove the existing container after stopping it
    echo "Removing "$container_name"..."
    docker rm "$container_name"
else
    echo "Container "$container_name" does not exist."
fi

# Create and start a new container
echo "Creating and starting "$container_name" now..."
docker run --restart=always -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=51Iw!k%&7?6yZ' -p 1441:1433 -d -v ./InitDB:/usr/src/app --name "$container_name" "$image_name"
