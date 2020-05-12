#!/usr/bin/env bash

set -euo pipefail

STACKNAME=$1

aws cloudformation package --template-file template.json --s3-bucket ldong-bucket-resized --output-template-file template.packaged
aws cloudformation deploy --template-file template.packaged --stack-name $STACKNAME

rm template.packaged