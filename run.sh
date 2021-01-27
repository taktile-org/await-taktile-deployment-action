#!/usr/bin/env bash

set -euo pipefail

# inputs given by GitHub action -e docker runtime env vars
TKTL_API_KEY=$INPUT_TKTL_API_KEY
COMMIT_SHA=$GITHUB_SHA

# Check
tktl login "$TKTL_API_KEY"

while tktl get deployments -c "$COMMIT_SHA" -f -O json | jq '.[].status' | grep -v -q 'running'; do
    sleep 2
    echo 'Waiting for deployment status to be running ...'
done

echo 'The status is now ...'
tktl get deployments -c "$COMMIT_SHA" -f -O json | jq '.[].status'
echo 'Deployment is live!'
