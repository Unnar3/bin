#!/bin/bash --
yellow='\033[1;33m'
NC='\033[0m' # No Color
if [ -z "$1" ]; then
    echo -e "${yellow}Running catkin_make${NC}"
    (cd ~/catkin_ws && catkin_make)
else
	echo -e "${yellow}Running catkin_make on package $1 ${NC}"
	(cd ~/catkin_ws && catkin_make --pkg $1)
fi
