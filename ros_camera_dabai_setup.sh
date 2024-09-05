#!/bin/bash

# Initialize device options
device_options=""
if [ -e /dev/video0 ]; then
    device_options+=" --device=/dev/video0"
fi

if [ -e /dev/video1 ]; then
    device_options+=" --device=/dev/video1"
fi

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
    --device /dev/bus/usb:/dev/bus/usb \
    --network scripts_my_bridge_network \
    $device_options\
    kyehuang/pros_dabai_dcw:0.0.2 \
    /bin/bash -c "source /opt/ros/humble/setup.bash && ros2 launch orbbec_camera dabai_dcw.launch.py & wait" 