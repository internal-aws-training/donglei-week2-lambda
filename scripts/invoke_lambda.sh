#!/usr/bin/env bash
set -euo pipefail

FUNCTIONNAME=$1

aws lambda invoke \
    --function-name $FUNCTIONNAME \
    --invocation-type Event \
    --payload file://input.json \
    output.json

cat output.json

rm output.json