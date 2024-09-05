#!/bin/bash

# Check if the Docker network exists; if not, create it
network_name="scripts_my_bridge_network"
if ! docker network ls | grep -q "$network_name"; then
    echo "Network $network_name does not exist. Creating..."
    docker network create "$network_name"
else
    echo "Network $network_name already exists."
fi

# Run the Docker container with the specified options
docker run -it --rm \
    --network scripts_my_bridge_network \
    -p 9090:9090 \
    kyehuang/pros_dabai_dcw:0.0.2 \
    /bin/bash -c "ros2 launch rosbridge_server rosbridge_websocket_launch.xml" 