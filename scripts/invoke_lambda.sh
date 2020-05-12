#!/usr/bin/env bash
set -euo pipefai

FUNCTIONNAME=$1

aws lambda invoke --function-name $FUNCTIONNAME  --invocation-type Event \
    --payload file://inputFile.txt output.json

cat output.json

rm output.json