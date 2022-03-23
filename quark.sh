#!/bin/sh
QUARK="$1"

if [ ! -d "$QUARK" ]; then
	echo "quark path is not exists!"
	exit 1
fi

cd "$QUARK" || exit
sudo make install clean
cd - || exit

start_file_service() {
	SNAME="$1"
	PORT="$2"
	FPATH="$3"

sudo tee "/usr/lib/systemd/system/${SNAME}.service" << EOF
[Unit]
Description=Quark Service Daemon
Wants=network.service
After=network.service
After=network.target
StartLimitIntervalSec=0

[Service]
ExecStart=/usr/local/bin/quark -p ${PORT} -h 127.0.0.1 -u nobume -g wheel -d ${FPATH} -l
ExecReload=/bin/kill -HUP \$MAINPID
KillMode=process
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF
}

sudo systemctl disable {f,m,s,v,h}list
sudo systemctl stop {f,m,s,v,h}list

start_file_service "flist" 8080 "/data/file"
start_file_service "mlist" 8081 "/data/mirrors"
start_file_service "slist" 8082 "/data/scripts"
start_file_service "vlist" 8083 "/data/videos"

start_file_service "hlist" 8084 "/data/videos/.hide"

sudo systemctl daemon-reload
sudo systemctl enable --now {f,m,s,v,h}list
