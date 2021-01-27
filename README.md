# Await Taktile Deployment Action

This action will wait until the commit hash that kicked it off has been turned into a running Taktile deployment. Use this action to block the next step in your GitHub Action job until the new deployment is live.

For example, this may be useful if you want to update the policy you layer on top of the model's predictions. You could use this action to wait until the new model is live and only then send an update request to the backend where you manage the policy you apply on top of predictions.

## Inputs

`TKTL_API_KEY`

**Required** Your Taktile API key, required to log into Taktile using the CLI. Should be stored in secrets, not the workflow yaml directly.

## Example usage

### GitHub Action Step

```
uses: ./.github/actions
with:
  TKTL_API_KEY: ${{ secrets.TKTL_API_KEY }}
```

### Complete GitHub Action

```
name: Check Deployment Status

on:
push

jobs:
check-deployment:
name: Check Deployment Status
runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@master
        with:
          fetch-depth: 1
      - name: Wait until deployment is live
        uses: taktile-org/await-taktile-deployment-action@VERSION
        with:
          TKTL_API_KEY: ${{ secrets.TKTL_API_KEY }}
```
