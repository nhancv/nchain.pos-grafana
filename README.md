# nchain.pos-grafana

## Default configuration

### Chain ID

- `evmos_9000-1`

### Node0 
- Prometheus Proof: `host.docker.internal:6060`
- Phlare RPC: `host.docker.internal:6065`
- Phlare Tendermint: `host.docker.internal:26660`

### Node1 
- Prometheus Proof: `host.docker.internal:6061`
- Phlare RPC: `host.docker.internal:6066`
- Phlare Tendermint: `host.docker.internal:26661`

### Node2
- Prometheus Proof: `host.docker.internal:6062`
- Phlare RPC: `host.docker.internal:6067`
- Phlare Tendermint: `host.docker.internal:26662`

### Node3
- Prometheus Proof: `host.docker.internal:6063`
- Phlare RPC: `host.docker.internal:6068`
- Phlare Tendermint: `host.docker.internal:26663`

## Custom node url

```
export CHAIN_ID=evmos_9000-1
export NODE_DOMAIN="domain1 domain2 domain3 domain4"

./update_urls.sh
```


## Local run

- Start

```
docker-compose up -d
```

- Stop

```
docker-compose down
```

## Default access

- Dashboard: http://localhost:3000
- User: admin/admin