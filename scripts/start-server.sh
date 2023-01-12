#!/bin/bash
echo "---Checking if 'accServer.exe' is present---"
if [ ! -f ${DATA_DIR}/accServer.exe ]; then
	touch ${DATA_DIR}/place-accServer.exe-here
	echo "+--------------------------------------------------------"
	echo "| Assetto Corsa Competizione Server executable not found!"
	echo "| Please be sure to place it in the root folder from the"
	echo "| Docker container!"
	echo "|"
	echo "| You have to download the Assetto Corsa Competizione"
	echo "| Dedicated Server from the Tools section in Steam."
	echo "| After the download finished right click Assetto Corsa"
	echo "| Competizione Dedicated Server -> Manage -> Browse local"
	echo "| files and copy over the 'accServer.exe' from the"
	echo "| directory .../server/accServer.exe to the root directory"
	echo "| from this Docker container and restart the container."
	echo "+--------------------------------------------------------"
     
	chmod -R 777 ${DATA_DIR}
	sleep infinity
else
	if [ -f ${DATA_DIR}/place-accServer.exe-here ]; then
		rm ${DATA_DIR}/place-accServer.exe-here
	fi
	echo "---'accServer.exe' found, continuing...---"
fi

echo "---Prepare Server---"
echo "---Checking if config files are present---"
if [ ! -d ${DATA_DIR}/cfg ]; then
	mkdir ${DATA_DIR}/cfg
fi
if [ ! -f ${DATA_DIR}/cfg/settings.json ]; then
	echo "---'settings.json' not found, copying!---"
	cp /tmp/settings.json ${DATA_DIR}/cfg/
fi
if [ ! -f ${DATA_DIR}/cfg/configuration.json ]; then
	echo "---'configuration.json' not found, copying!---"
	cp /tmp/configuration.json ${DATA_DIR}/cfg/
fi
if [ ! -f ${DATA_DIR}/cfg/event.json ]; then
	echo "---'event.json' not found, copying!---"
	cp /tmp/event.json ${DATA_DIR}/cfg/
fi
if [ ! -f ${DATA_DIR}/cfg/eventRules.json ]; then
	echo "---'eventRules.json' not found, copying!---"
	cp /tmp/eventRules.json ${DATA_DIR}/cfg/
fi

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

echo "---Start Server---"
cd ${DATA_DIR}
wine64 ${DATA_DIR}/accServer.exe