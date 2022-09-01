#/bin/bash
vcs import --input https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos src
sudo apt upgrade
sudo rosdep init
rosdep update
mkdir -p src
rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
colcon build --symlink-install -y