FROM ghcr.io/otischung/pros_ai_image:1.3.6
ENV ROS_DISTRO=humble

COPY . /tmp
RUN mv /tmp/OrbbecSDK_ROS2 /workspaces/src
    
WORKDIR /workspaces

# bootstrap rosdep
RUN apt update && rosdep update --rosdistro $ROS_DISTRO && \

# setup colcon mixin and metadata
    colcon mixin update && \
    colcon metadata update && \
    rosdep install -q -y -r --from-paths src --ignore-src && \
    source /opt/ros/humble/setup.bash && colcon build --mixin release && \
    source ./install/setup.bash

ENTRYPOINT [ "/ros_entrypoint.bash" ]
CMD ["/bin/bash", "-l"]
