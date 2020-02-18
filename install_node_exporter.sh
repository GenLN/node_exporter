#!/bin/sh

##get node exporter gzip
wget https://github.com/GenLN/node_exporter/releases/download/v1/node_exporter_0.18.1.darwin.amd64.tar.gz

##unzip to /opt
tar -xzvf node_exporter_0.18.1.darwin.amd64.tar.gz -C /opt/

##copy service file
cp /opt/node_exporter/node_exporter.service /etc/systemd/system/

##restart daemon and start service
systemctl daemon-reload
systemctl start node_exporter
systemctl status node_exporter
