# Await Taktile Deployment Action

This action will wait until the commit hash that kicked it off has been turned into a running Taktile deployment. Use this action to block the next step in your GitHub Action job until that new deployment is live.

## Inputs

`TKTL_API_KEY`

**Required** Your Taktile API key, required to log into Taktile using the CLI. Should be stored in secrets, not the workflow yaml directly.

## Example

### GitHub Action Step

```
uses: ./.github/actions
with:
  TKTL_API_KEY: ${{ secrets.TKTL_API_KEY }}
```

### Movitation

This action could be useful if you apply a policy on top of the model's predictions and want to update that policy when you update your model. You would use this action to wait until the new model is live. After that you could send an update request to the backend where you manage the policy.

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
      - name: Send update to policy backend
        run:
          run: source update_policy.sh
```
