source catkin_ws/devel/setup.bash
source Firmware/Tools/setup_gazebo.bash $(pwd) $(pwd)/Firmware/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware/Tools/sitl_gazebo
export GAZEBO_RESOURCE_PATH=$(pwd)/Firmware/Tools/sitl_gazebo/worlds:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=$(pwd)/Firmware/Tools/sitl_gazebo/models:$GAZEBO_MODEL_PATH
export SVGA_VGPU10=0
