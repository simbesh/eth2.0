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

## Secret

### Deploy
```
microk8s kubectl create secret generic validator-secret --from-file=/home/owodunni/.prysm/validator/keystore.json --from-file=/home/owodunni/.prysm/validator/shardwithdrawalkey9941b8af035d --from-file=/home/owodunni/.prysm/validator/validatorprivatekey8953477b2782
```
