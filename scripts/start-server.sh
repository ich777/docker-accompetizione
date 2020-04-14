#!/bin/bash

echo "---Prepare Server---"
export WINEARCH=win64
export WINEPREFIX=/acc/WINE64
echo "---Checking if WINE workdirectory is present---"
if [ ! -d ${DATA_DIR}/WINE64 ]; then
	echo "---WINE workdirectory not found, creating please wait...---"
    mkdir ${DATA_DIR}/WINE64
else
	echo "---WINE workdirectory found---"
fi
echo "---Checking if WINE is properly installed---"
if [ ! -d ${DATA_DIR}/WINE64/drive_c/windows ]; then
	echo "---Setting up WINE---"
    cd ${DATA_DIR}
    winecfg > /dev/null 2>&1
    sleep 15
else
	echo "---WINE properly set up---"
fi

chmod -R ${DATA_PERM} ${DATA_DIR}
echo "---Server ready---"

echo "---Sleep zZz---"
sleep infinity

echo "---Start Server---"
cd ${DATA_DIR}