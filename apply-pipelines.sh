#! /bin/bash

set -e

FILES="*.yml"

for FILE in $FILES
do
	NAME=$(basename $FILE .yml)
  echo "Applying config for: $NAME"
	fly -t remote set-pipeline -p $NAME -c $FILE -n
	fly -t remote unpause-pipeline -p $NAME
done
