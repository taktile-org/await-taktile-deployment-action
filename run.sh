#!/usr/bin/env bash

set -euo pipefail

# inputs given by GitHub action -e docker runtime env vars
TKTL_API_KEY=$INPUT_TKTL_API_KEY
# GITHUB_SHA is the commit hash of the running action and set by github. 
# DEPLOY_SHA can be set in the github action to watch for a different deployment
COMMIT_SHA="${INPUT_DEPLOY_SHA:-$GITHUB_SHA}"

# Check
tktl login "$TKTL_API_KEY"

while tktl get deployments -c "$COMMIT_SHA" -f -O json | jq '.[].status' | grep -vE -q 'running|profiling'; do
    sleep 2
    echo 'Waiting for deployment to complete (status profiling or running) ...'
done

echo 'The status is now ...'
tktl get deployments -c "$COMMIT_SHA" -f -O json | jq '.[].status'
echo 'Deployment is live!'
