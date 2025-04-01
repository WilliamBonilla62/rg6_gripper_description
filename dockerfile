# Use the official ROS Noetic desktop full image as base
FROM osrf/ros:noetic-desktop-full

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_WORKSPACE=/ros_ws

RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    build-essential \
    vim \
    git \
    libpcap-dev \
    net-tools \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*


# Source ROS setup and create a workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    mkdir -p ${ROS_WORKSPACE}/src && \
    cd ${ROS_WORKSPACE} && \
    catkin_make"

# Set environment for ROS workspace
ENV CATKIN_WS=${ROS_WORKSPACE}
WORKDIR ${ROS_WORKSPACE}
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source ${ROS_WORKSPACE}/devel/setup.bash" >> ~/.bashrc

# Default command
CMD ["/bin/bash"]
