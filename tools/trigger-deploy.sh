#!/usr/bin/env bash
set -euo pipefail

# Triggers the GitHub Actions deployment workflow via the REST API.
# Requires a PAT with repo/workflow scope stored in GITHUB_TOKEN.

WORKFLOW_FILE="deploy.yml"
REF="${1:-main}"
OWNER="afletch32"
REPO="Octoberphotobooth-main"

: "${GITHUB_TOKEN:?Set GITHUB_TOKEN to a GitHub token with 'workflow' scope}"

API_URL="https://api.github.com/repos/${OWNER}/${REPO}/actions/workflows/${WORKFLOW_FILE}/dispatches"

payload=$(cat <<JSON
{
  "ref": "${REF}"
}
JSON
)

curl -fsSL -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -d "${payload}" \
  "${API_URL}"

echo "Triggered workflow ${WORKFLOW_FILE} on ref ${REF}"
