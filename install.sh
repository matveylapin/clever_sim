#!/bin/bash
sudo apt -y update
sudo apt -y upgrade

sudo apt -y install curl
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt -y update
{
    sudo apt -y install ros-melodic-desktop-full
} || {
    echo -e "\e[1;31m ROS installation failed \e[0m"
    exit
}

echo -e "\e[1;42m ROS installation is successful \e[0m"

sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools
{
    sudo rosdep init
} || {
    {
        rosdep init
    } || {
        echo -e "\e[1;31m ROS init failed \e[0m"
        exit
    }
}
echo -e "\e[1;42m ROS init is succescful \e[0m"

rosdep update

sudo apt -y install ros-melodic-gazebo-ros \
                     ros-melodic-gazebo-dev \
                     ros-melodic-gazebo-plugins \
                     ros-melodic-gazebo-ros-pkgs \
                     ros-melodic-gazebo-msgs \
                     ros-melodic-geographic-msgs \
                     python-jinja2


sudo apt-get -y install python-pip python3-pip catkin
sudo apt-get -y --quiet --no-install-recommends install bzip2 ca-certificates ccache cmake cppcheck curl dirmngr doxygen file g++ gcc gdb git gnupg gosu lcov libfreetype6-dev libgtest-dev libpng-dev lsb-release make ninja-build openjdk-8-jdk openjdk-8-jre openssh-client pkg-config python-pip python-pygments python-setuptools rsync shellcheck tzdata unzip wget xsltproc zip ant gazebo9 gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly libeigen3-dev libgazebo9-dev libgstreamer-plugins-base1.0-dev libimage-exiftool-perl libopencv-dev libxml2-utils pkg-config protobuf-compiler libgeographic-dev libignition-math2-dev

sudo apt install -y geographiclib-tools

sudo pip install setuptools pkgconfig wheel
sudo pip install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

sudo pip3 install setuptools pkgconfig wheel
sudo pip3 install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

wget -qO- https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
### CLEVER

sudo apt -y --fix-broken install
sudo apt -y autoremove

mkdir -p catkin_ws/src
cd catkin_ws/src
cd ../
{
    catkin_make
} || {
    echo -e "\e[1;31m catkin_make failed \e[0m"
    exit
}
echo -e "\e[1;42m catkin init is succescful \e[0m"

source devel/setup.bash
cd src
git clone https://github.com/CopterExpress/clever.git

# Patching

cd clever
cd clover 

sudo bash ../../../../clever_sim/patch_clever.sh
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
{
    sudo make DONT_RUN=YES -j4 px4_sitl_default gazebo
} || {
    echo -e "\e[1;31m make is failed \e[0m"
    exit
}
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


echo -e "\e[1;42m INSTALLATION IS SUCCESCFUL \e[0m"
echo -e "\e[1;42m INSTALLATION IS SUCCESCFUL \e[0m"
echo -e "\e[1;42m INSTALLATION IS SUCCESCFUL \e[0m"
echo -e "\e[1;42m INSTALLATION IS SUCCESCFUL \e[0m"
echo -e "\e[1;42m INSTALLATION IS SUCCESCFUL \e[0m"
echo -e "\e[1;42m for run type 'roslaunch clever_sim/run.launch' \e[0m"