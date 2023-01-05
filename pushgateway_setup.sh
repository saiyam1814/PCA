wget https://github.com/prometheus/pushgateway/releases/download/v0.8.0/pushgateway-0.8.0.linux-amd64.tar.gz
useradd --no-create-home --shell /bin/false pushgateway
tar -xvf pushgateway-0.8.0.linux-amd64.tar.gz
cp pushgateway-0.8.0.linux-amd64/pushgateway /usr/local/bin/pushgateway
chown pushgateway:pushgateway /usr/local/bin/pushgateway

cat > /etc/systemd/system/pushgateway.service << EOF
[Unit]
Description=Pushgateway
Wants=network-online.target
After=network-online.target

[Service]
User=pushgateway
Group=pushgateway
Type=simple
ExecStart=/usr/local/bin/pushgateway     --web.listen-address=":9091"     --web.telemetry-path="/metrics"     --persistence.file="/tmp/metric.store"     --persistence.interval=5m     --log.level="info"     --log.format="logger:stdout?json=true"

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl restart pushgateway
