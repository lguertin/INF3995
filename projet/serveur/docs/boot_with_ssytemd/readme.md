

Files :
- "elevation_server.service" must be placed in "/etc/systemd/system/"
- "launch_server.sh" must be placed in "/etc/systemd/system/server"

Commands :
	- enable service : systemctl enable elevation_server.service
	- start service : systemctl start elevation_server.service
	- enable service : systemctl enable elevation_server.service
	- get the service status : systemctl status elevation_server.service

	- see the logs in real time : journalctl -f -u elevation_server.service

