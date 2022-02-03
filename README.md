# AssettoCorsa Competizione Server in Docker optimized for Unraid
This Docker will run the AssettoCorsa Competizione Server.

ATTENTION: You have to copy over the 'accServer.exe' in your server directory, you can find it in your GAMEDIRECTORY/accServer.exe
Let the container start up for the first time, copy over the file and then restart the container.

>**NOTE** The initial servername and credentials are: 'ACC Docker Server' Password: 'Docker' AdminPassword: 'adminDocker' (all config files are located in the '/cfg' directory in your serverfolder).

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