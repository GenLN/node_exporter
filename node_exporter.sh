#! /bin/sh

wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar xvf node_exporter-1.3.1.linux-amd64.tar.gz
cd node_exporter-1.3.1.linux-amd64
cp node_exporter /usr/local/bin
# Exit current directory
cd ..

# Remove the extracted directory
rm -rf ./node_exporter-1.3.1.linux-amd64

# Remove zipped file
rm -rf node_exporter-1.3.1.linux-amd64.tar.gz

useradd --no-create-home --shell /bin/false node_exporter
chown node_exporter:node_exporter /usr/local/bin/node_exporter

wget https://github.com/GenLN/node_exporter/blob/master/node_exporter.service
mv node_exporter.service /etc/systemd/system/

systemctl daemon-reload
systemctl start node_exporter
