#!/bin/bash --
yellow='\033[1;33m'
NC='\033[0m' # No Color

PKG1=""
PKG2=""
ERR=""
PA=""


while [[ $# > 0 ]]
do
key="$1"

case $key in
    -pkg|--pkg)
    PKG2="$2"
    PKG1="--pkg"
    shift
    ;;
    -err|--error)
    ERR="e"
    if [[ -z $2 ]]; then
    	PA=$PWD
	else
		PA="$2"
	fi
    shift
    ;;
    *)
            # unknown option
    ;;
esac
shift
done

if [[ -z "$PKG1" ]]; then
	echo -e "${yellow}Running catkin_make${NC}"
else
	echo -e "${yellow}Running catkin_make on package $PKG2 ${NC}"
fi

if [[ -z "$ERR" ]]; then
	(cd ~/catkin_ws && catkin_make ${PKG1} ${PKG2})
else
	echo -e "${yellow}ERROR log in folder: ${PA} ${NC}"
	(cd ~/catkin_ws && catkin_make ${PKG1} ${PKG2} 2>&1 1>${PA}/stdout.log | tee ${PA}/stderr.log)
fi