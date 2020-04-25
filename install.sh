#!/bin/bash
### CLEVER
sudo apt -y update
sudo apt -y upgrade

./clever_sim/install_ros.sh

sudo apt -y update
sudo apt -y upgrade
sudo apt -y --fix-broken install

./clever_sim/install_dep.sh

sudo apt -y --fix-broken install

sudo apt -y autoremove

mkdir -p catkin_ws/src
cd catkin_ws/src
cd ../
catkin_make
source devel/setup.bash
cd src
git clone https://github.com/CopterExpress/clever.git

# Patching

cd clever
cd clover 

sudo ../../../../clever_sim/patch_clever.sh
# END

# DEP
cd ../../../
rosdep install -y --from-paths src --ignore-src -r

# END

catkin_make #now!!!!!!!!!
source devel/setup.bash

### END

cd ../


### PX4
git clone https://github.com/CopterExpress/Firmware.git
# echo aaa $(pwd)
cd ./Firmware
git submodule update --init --recursive
# echo aaa $(pwd)
cd ./Tools/sitl_gazebo/include
# echo aaa $(pwd)
sudo patch < ../../../../clever_sim/patches/gazebo_opticalflow_plugin.patch
# echo aaa $(pwd)
cd ../../../
sudo make DONT_RUN=YES -j4 px4_sitl_default gazebo
echo aaa $(pwd)
cp -fRa ../clever_sim/models/iris ./Tools/sitl_gazebo/models
cp -fRa ../clever_sim/models/aruco_map_10_10 ./Tools/sitl_gazebo/models
cp -f ../clever_sim/worlds/empty.world ./Tools/sitl_gazebo/worlds
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo
export GAZEBO_RESOURCE_PATH=$(pwd)/worlds:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=$(pwd)/models:$GAZEBO_MODEL_PATH
export SVGA_VGPU10=0
cd ../
source ./clever_sim/env.sh
