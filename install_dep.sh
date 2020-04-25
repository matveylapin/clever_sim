#!/bin/bash
sudo apt-get -y install ros-melodic-gazebo-ros \
                     ros-melodic-gazebo-dev \
                     ros-melodic-gazebo-plugins \
                     ros-melodic-gazebo-ros-pkgs \
                     ros-melodic-gazebo-msgs \
                     ros-melodic-geographic-msgs \
                     python-jinja2

sudo apt-get update

sudo apt-get -y install python-pip python3-pip
sudo apt-get -y --quiet --no-install-recommends install bzip2 ca-certificates ccache cmake cppcheck curl dirmngr doxygen file g++ gcc gdb git gnupg gosu lcov libfreetype6-dev libgtest-dev libpng-dev lsb-release make ninja-build openjdk-8-jdk openjdk-8-jre openssh-client pkg-config python-pip python-pygments python-setuptools rsync shellcheck tzdata unzip wget xsltproc zip ant gazebo9 gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly libeigen3-dev libgazebo9-dev libgstreamer-plugins-base1.0-dev libimage-exiftool-perl libopencv-dev libxml2-utils pkg-config protobuf-compiler libgeographic-dev libignition-math2-dev

sudo apt inatall -y geographiclib-tools

sudo pip install setuptools pkgconfig wheel
sudo pip install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

sudo pip3 install setuptools pkgconfig wheel
sudo pip install docopt argparse argcomplete coverage jinja2 empy numpy requests serial toml pyyaml cerberus

wget -qO- https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh | sudo bash
