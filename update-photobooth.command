#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

TOKEN_FILE="${SCRIPT_DIR}/.github-token"
if [[ ! -s "$TOKEN_FILE" ]]; then
  echo "[!] Missing GitHub token."
  echo "Create ${TOKEN_FILE} containing a Personal Access Token with workflow scope."
  read -r -p "Press Enter to close this window." _
  exit 1
fi

export GITHUB_TOKEN="$(< "$TOKEN_FILE")"

echo "Updating repo at $SCRIPT_DIR"
git pull --ff-only

echo "Triggering deploy workflow..."
./tools/trigger-deploy.sh
echo "Workflow dispatched. Latest commit:"
git --no-pager log -1 --oneline

read -r -p "Done! Press Enter to close this window." _
