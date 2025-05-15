#!/bin/bash

PHLARE_CONF=$(pwd)/phlare/phlare-full.yaml
PROMETHEUS_CONF=$(pwd)/prometheus/prometheus-full.yml
GRAFANA_COSMOS_CONF=$(pwd)/grafana/provisioning/dashboards/cosmos-dashboard.json
GRAFANA_NODE_CONF=$(pwd)/grafana/provisioning/dashboards/node-full-dashboard.json

IFS=' ' read -r -a domains <<< "$NODE_DOMAIN"

# Update phlare config header
echo "scrape_configs:" > $PHLARE_CONF
phlare_block=$(awk 'NR>1 {print}' $PHLARE_CONF.bk)

# Update prometheus config header
awk '/scrape_configs:/ {print; exit} {print}' $PROMETHEUS_CONF.bk > $PROMETHEUS_CONF
awk '/- job_name: '\''prometheus'\''/{flag=1} flag && !/^  - job_name: "node0"/{print} /^  - job_name: "node0"/{flag=0}' $PROMETHEUS_CONF.bk | sed '/^- job_name: "node0"/d' >> $PROMETHEUS_CONF
prometheus_block_node=$(awk '/- job_name: "node0"/{flag=1} /- job_name: "/ && !/- job_name: "node0"/ && flag{exit} flag' $PROMETHEUS_CONF.bk)

for i in "${!domains[@]}"; do
  domain="${domains[$i]}"

  # Generate phlare block for each node
  echo "$phlare_block" | \
    sed "s/job_name: \"node0\"/job_name: \"node$i\"/" | \
    sed "s/targets: \\[\"host.docker.internal:6060\"\\]/targets: [\"$domain:6060\"]/" \
    >> $PHLARE_CONF
  echo "" >> $PHLARE_CONF

  # Update prometheus config for each node
  echo "$prometheus_block_node" | \
    sed "s/job_name: \"node0\"/job_name: \"node${i}\"/" | \
    sed "s/host.docker.internal:26660/${domain}:26660/" \
    >> $PROMETHEUS_CONF
  echo "" >> $PROMETHEUS_CONF
  
done
rm -rf "$PHLARE_CONF.bak"
rm -rf "$PROMETHEUS_CONF.bak"

sed -i.bak "s/evmos_9000-1/$CHAIN_ID/g" "$GRAFANA_COSMOS_CONF"
rm -rf "$GRAFANA_COSMOS_CONF.bak"

sed -i.bak "s/evmos_9000-1/$CHAIN_ID/g" "$GRAFANA_NODE_CONF"
rm -rf "$GRAFANA_NODE_CONF.bak"