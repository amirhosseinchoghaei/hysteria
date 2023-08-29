#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color



echo "Running as root..."
sleep 2
clear

##Scanning


service passwall stop

if [[ -f hyster.ipk ]]

then 

  rm hyster.ipk

else 

  echo "Stage 2 Passed" 

fi


cd /tmp
echo "Downloading latest version of hysteria ..."
wget -q https://amir3.space/hyster.ipk

if [[ -f hyster.ipk ]]

then 

  echo -e "${GREEN} Download Successful ! ${ENDCOLOR}"

else 

  echo -e "${RED} ERROR : Download Unsuccessful Check Internet Connection ${ENDCOLOR}"
  exit 1
  
fi

echo -e "${MAGENTA} INSTALLING hysteria ... ${ENDCOLOR}"
opkg install hyster.ipk -d ram


if [[ -f hyster.ipk ]]

then 

  rm hyster.ipk

else 

  echo "Stage 1 Passed" 

fi

service passwall restart
cd /root/

echo "Done !"








rm hysteria.sh
