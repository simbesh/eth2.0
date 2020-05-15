# Readme
This is a repository for deploying a beacon node and a validator using kubernetes and prysm

# Setup

## Beacon

```
microk8s kubectl apply -fbeacon-node-service.yaml -fbeacon-data-persistentvolumeclaim.yaml -f beacon-node-deployment.yaml
```

## Validator

```
microk8s kubectl apply -f validator-secret.yaml -f validator-deployment.yaml
```

## Eth2Stat
[Eth2Stat](https://eth2stats.io/) can be used to monitor the node.

```
microk8s kubectl apply -f eth2stat-data-persistentvolumeclaim.yaml -f eth2stat-deployment.yaml
```

## Secret
My secret dosn't work, don't know why at this time.

### Deploy
```
microk8s kubectl create secret generic validator-secret --from-file=/home/owodunni/.prysm/validator/keystore.json --from-file=/home/owodunni/.prysm/validator/shardwithdrawalkey9941b8af035d --from-file=/home/owodunni/.prysm/validator/validatorprivatekey8953477b2782
```

## TODO
Use eth2stats to monitor the beacon node:

docker run -d --restart always --network="host" \
--name eth2stats-client \
-v ~/.eth2stats/data:/data \
alethio/eth2stats-client:latest run \
--eth2stats.node-name="owerdone" \
--data.folder="/data" \
--eth2stats.addr="grpc.topaz.eth2stats.io:443" --eth2stats.tls=true \
--beacon.type="prysm" \
--beacon.addr="localhost:4000" \
--beacon.metrics-addr="http://localhost:8080/metrics"
