#!/bin/bash

img_registry=docker.io/matbu/aee-fedora-osm:latest

image_id=$(podman image list  | grep 'localhost/aee-fedora-osm-1' | awk '{print $3}')
echo $image_id
if [ -n "$image_id" ]; then
    echo "Removing image with ID: $image_id"
    podman image rm $image_id
else
    echo "No image found for 'localhost/aee-fedora-osm-1', skipping removal."
fi

echo "Bulding image..."
podman build -t aee-fedora-osm-1 .
echo "Pushing image..."
podman push localhost/aee-fedora-osm-1 $img_registry
