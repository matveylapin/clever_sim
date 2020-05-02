#!/bin/bash
# Clever for PC
{
sudo patch < ../../../../clever_sim/patches/CMakeLists.patch

sudo cp -f ../../../../clever_sim/patches/files_for_clover/launch/aruco.launch ./launch/
sudo cp -f ../../../../clever_sim/patches/files_for_clover/launch/sitl.launch ./launch/
sudo cp -f ../../../../clever_sim/patches/files_for_clover/map.txt ../aruco_pose/map/
} || {
    echo -e "\e[1;31m patch_clever.sh error \e[0m"
    exit
}

echo -e "\e[1;42m patch clever is succescful \e[0m"