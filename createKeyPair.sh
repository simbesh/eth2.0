docker run -it -v $(pwd):/data \
   gcr.io/prysmaticlabs/prysm/validator:latest \
   accounts create --keystore-path=/data --password=$VALIDATOR_PASSWORD