#!/bin/bash
sudo apt -y install curl
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -

sudo apt update

sudo apt -y install ros-melodic-desktop-full

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools
sudo rosdep init
rosdep update

sudo apt -y install ros-melodic-gazebo-ros \
                     ros-melodic-gazebo-dev \
                     ros-melodic-gazebo-plugins \
                     ros-melodic-gazebo-ros-pkgs \
                     ros-melodic-gazebo-msgs \
                     ros-melodic-geographic-msgs \
                     python-jinja2

sudo apt-get update

sudo apt-get -y install python-pip python3-pip
sudo apt-get -y --quiet --no-install-recommends install bzip2 ca-certificates ccache cmake cppcheck curl dirmngr doxygen file g++ gcc gdb git gnupg gosu lcov libfreetype6-dev libgtest-dev libpng-dev lsb-release make ninja-build openjdk-8-jdk openjdk-8-jre openssh-client pkg-config python-pip python-pygments python-setuptools rsync shellcheck tzdata unzip wget xsltproc zip ant gazebo9 gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly libeigen3-dev libgazebo9-dev libgstreamer-plugins-base1.0-dev libimage-exiftool-perl libopencv-dev libxml2-utils pkg-config protobuf-compiler libgeographic-dev libignition-math2-dev

sudo apt install -y geographiclib-tools

sudo pip install setuptools pkgconfig wheel catkin-tools
sudo pip install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

sudo pip3 install setuptools pkgconfig wheel catkin-tools
sudo pip3 install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

wget -qO- https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash
