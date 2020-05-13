#!/usr/bin/env bash

set -euo pipefail

FUNCTION_NAME=$1

zip -q -r "${FUNCTION_NAME}.zip" index.js package.json

echo "zip file '${FUNCTION_NAME}.zip' success."


aws s3 cp  ${FUNCTION_NAME}.zip s3://ldong-bucket-resized/${FUNCTION_NAME}.zip

aws lambda create-function --function-name  ${FUNCTION_NAME} \
    --zip-file fileb://${FUNCTION_NAME}.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --timeout 30 \
    --memory-size 1024 \
    --role "arn:aws:iam::494526681395:role/ldong-lambda-s3-role"

echo "${FUNCTION_NAME} was created.."

rm ${FUNCTION_NAME}.zip 
