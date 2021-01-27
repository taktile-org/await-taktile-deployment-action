# Await Taktile Deployment action

This action should be used as a step before you act based on the new deployment going live,
as it will block the next step until it finishes when the deployment with the new commit hash is deployed.

## Inputs

### `TKTL_API_KEY`

**Required** Your Taktile API key, required to log into Taktile using the CLI. Should be stored in secrets, not the workflow yaml directly.

## Outputs

### `new-git-hash`

The git hash of the code that was newly deployed.

## Example usage

```
uses: ./.github/actions
with:
  TKTL_API_KEY: ${{ secrets.TKTL_API_KEY }}
```
