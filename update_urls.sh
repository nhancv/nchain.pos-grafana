#!/bin/bash

PHLARE_CONF=$(pwd)/phlare/phlare-full.yaml
PROMETHEUS_CONF=$(pwd)/prometheus/prometheus-full.yml
GRAFANA_COSMOS_CONF=$(pwd)/grafana/provisioning/dashboards/cosmos-dashboard.json
GRAFANA_NODE_CONF=$(pwd)/grafana/provisioning/dashboards/node-full-dashboard.json

cp $PHLARE_CONF.bk $PHLARE_CONF
cp $PROMETHEUS_CONF.bk $PROMETHEUS_CONF

sed -i.bak "s/host.docker.internal:6060/$NODE0_PROOF_URL/g" "$PHLARE_CONF"
sed -i.bak "s/host.docker.internal:6061/$NODE1_PROOF_URL/g" "$PHLARE_CONF"
sed -i.bak "s/host.docker.internal:6062/$NODE2_PROOF_URL/g" "$PHLARE_CONF"
sed -i.bak "s/host.docker.internal:6063/$NODE3_PROOF_URL/g" "$PHLARE_CONF"
rm -rf "$PHLARE_CONF.bak"

sed -i.bak "s/host.docker.internal:6065/$NODE0_RPC_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:6066/$NODE1_RPC_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:6067/$NODE2_RPC_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:6068/$NODE3_RPC_URL/g" "$PROMETHEUS_CONF"
rm -rf "$PROMETHEUS_CONF.bak"

sed -i.bak "s/host.docker.internal:26660/$NODE0_TENDERMINT_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:26661/$NODE1_TENDERMINT_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:26662/$NODE2_TENDERMINT_URL/g" "$PROMETHEUS_CONF"
sed -i.bak "s/host.docker.internal:26663/$NODE3_TENDERMINT_URL/g" "$PROMETHEUS_CONF"
rm -rf "$PROMETHEUS_CONF.bak"

sed -i.bak "s/evmos_9000-1/$CHAIN_ID/g" "$GRAFANA_COSMOS_CONF"
rm -rf "$GRAFANA_COSMOS_CONF.bak"

sed -i.bak "s/evmos_9000-1/$CHAIN_ID/g" "$GRAFANA_NODE_CONF"
rm -rf "$GRAFANA_NODE_CONF.bak"