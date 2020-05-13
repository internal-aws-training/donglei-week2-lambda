#!/usr/bin/env bash

FUNCTION_NAME=$1

zip -q -r "${FUNCTION_NAME}.zip" .

echo "zip file '${FUNCTION_NAME}.zip' success."

aws lambda create-function \
    --function-name ${FUNCTION_NAME} \
    --zip-file fileb://${FUNCTION_NAME}.zip \
    --role "arn:aws:iam::494526681395:role/ldong-lambda-s3-role" \
    --runtime nodejs12.x \
    --handler index.handler \
    --timeout 30

aws lambda update-function-code \
    --function-name ${FUNCTION_NAME} \
    --zip-file fileb://${FUNCTION_NAME}.zip

rm "${FUNCTION_NAME}.zip"