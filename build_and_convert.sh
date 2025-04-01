#!/bin/bash

# Colors for status messages
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Workspace and package paths
PACKAGE_NAME="rg6_gripper_description"
URDF_DIR="/ros_ws/src/$PACKAGE_NAME/urdf"
XACRO_FILE="rg6_gripper.xacro"
URDF_FILE="rg6_gripper.urdf"

echo -e "${GREEN}[*] Building Catkin workspace...${NC}"
catkin_make

if [ $? -ne 0 ]; then
    echo -e "${RED}[!] catkin_make failed. Exiting.${NC}"
    exit 1
fi

# Source the workspace
source devel/setup.bash
cd "$URDF_DIR"
echo -e "${GREEN}[*] Converting Xacro to URDF...${NC}"

if [ ! -f "$XACRO_FILE" ]; then
    echo -e "${RED}[!] Xacro file not found: $XACRO_FILE${NC}"
    exit 1
fi

xacro "$XACRO_FILE" -o "$URDF_FILE"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[✓] Successfully converted to: $URDF_FILE${NC}"
else
    echo -e "${RED}[!] Failed to convert Xacro to URDF.${NC}"
    exit 1
fi
