#!/usr/bin/env bash
set -euo pipefail

FUNCTIONNAME=$1

aws lambda delete-function --function-name $FUNCTIONNAME
