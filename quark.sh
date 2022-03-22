#!/bin/sh
QUARK="$1"

if [ ! -d "$QUARK" ]; then
	echo "quark path is not exists!"
	exit 1
fi

cd "$QUARK" || exit
sudo make install clean
cd - || exit

sudo tee /usr/lib/systemd/system/FileList.service << "EOF"
[Unit]
Description=Quark Service Daemon
Wants=network.service
After=network.service
After=network.target
StartLimitIntervalSec=0

[Service]
ExecStart=/usr/local/bin/quark -p 8080 -h 127.0.0.1 -u nobume -g wheel -d /data -l
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF

sudo tee /usr/lib/systemd/system/HideList.service << "EOF"
[Unit]
Description=Quark Service Daemon
Wants=network.service
After=network.service
After=network.target
StartLimitIntervalSec=0

[Service]
ExecStart=/usr/local/bin/quark -p 8081 -h 127.0.0.1 -u nobume -g wheel -d /data/Videos/.hide -l
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now FileList HideList
