#!/bin/bash
mkdir -p src
git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup
sudo apt update && rosdep update
rosdep install --from-paths src --ignore-src -y
sudo apt install python3-pip -y
colcon build
source install/local_setup.bash
# Create firmware step
ros2 run micro_ros_setup create_firmware_ws.sh host
# Build step
ros2 run micro_ros_setup build_firmware.sh
source install/local_setup.bash
# Download micro-ROS-Agent packages
ros2 run micro_ros_setup create_agent_ws.sh
# Build step
ros2 run micro_ros_setup build_agent.sh
source install/local_setup.bash
