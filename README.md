# AssettoCorsa Competizione Server in Docker optimized for Unraid
This Docker will run the AssettoCorsa Competizione Server.

**ATTENTION:** Please download the Assetto Corsa Competizione Dedicated Server from the Tools section in Steam. After the download finished right click Assetto Corsa Competizione Dedicated Server -> Manage -> Browse local files and copy over the 'accServer.exe' from the directory .../server/accServer.exe to the root directory from this container and restart the container.

**NOTE** The initial servername and credentials are: 'ACC Docker Server' Password: 'Docker' AdminPassword: 'adminDocker' (all config files are located in the '/cfg' directory in your serverfolder).

**Server List:** Please note that it takes a few minutes after the container is startet that the game is visible on the in game server list.

## Env params
| Name | Value | Example |
| --- | --- | --- |
| DATA_DIR | Folder for gamefiles | /acc |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |
| UMASK | User file permission mask for newly created files | 000 |
| DATA_PERM | Data permissions for main storage folder | 770 |

## Run example
```
docker run --name AssettoCorsaCompetizione -d \
	-p 9201:9201 -p 9201:9201/udp \
	--env 'UID=99' \
	--env 'GID=100' \
	--env 'UMASK=000' \
	--env 'DATA_PERM=770' \
	--volume /path/to/assettocorsacompetizione:/acc \
	ich777/accompetizione-server
```

This Docker was mainly edited for better use with Unraid, if you don't use Unraid you should definitely try it!

#### Support Thread: https://forums.unraid.net/topic/79530-support-ich777-gameserver-dockers/