# nchain.pos-grafana

## Default configuration

### Node0 
- Proof: `host.docker.internal:6060`
- RPC: `host.docker.internal:6065`
- Tendermint: `host.docker.internal:26660`

### Node1 
- Proof: `host.docker.internal:6061`
- RPC: `host.docker.internal:6066`
- Tendermint: `host.docker.internal:26661`

### Node2
- Proof: `host.docker.internal:6062`
- RPC: `host.docker.internal:6067`
- Tendermint: `host.docker.internal:26662`

### Node3
- Proof: `host.docker.internal:6063`
- RPC: `host.docker.internal:6068`
- Tendermint: `host.docker.internal:26663`

## Custom node url

```
export NODE0_PROOF_URL=host.docker.internal:6060
export NODE1_PROOF_URL=host.docker.internal:6061
export NODE2_PROOF_URL=host.docker.internal:6062
export NODE3_PROOF_URL=host.docker.internal:6063

export NODE0_RPC_URL=host.docker.internal:6065
export NODE1_RPC_URL=host.docker.internal:6066
export NODE2_RPC_URL=host.docker.internal:6067
export NODE3_RPC_URL=host.docker.internal:6068

export NODE0_TENDERMINT_URL=host.docker.internal:26660
export NODE1_TENDERMINT_URL=host.docker.internal:26661
export NODE2_TENDERMINT_URL=host.docker.internal:26662
export NODE3_TENDERMINT_URL=host.docker.internal:26663

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