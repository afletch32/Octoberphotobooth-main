# October Photo Booth

## Triggering a Deploy Manually

1. Create a GitHub personal access token (classic) with `repo` and `workflow` scopes.
2. Export it in your shell before running the helper script:
   ```bash
   export GITHUB_TOKEN=ghp_yourTokenHere
   ```
3. Store your token in `.github-token` (ignored by git) so helper scripts can read it.
4. From the project root, run:
   ```bash
   ./tools/trigger-deploy.sh [branch]
   ```
   Omit `[branch]` to use `main`. The script calls the GitHub Actions API to start the `Deploy Photobooth` workflow, which runs `npm run ship` and deploys to Cloudflare Pages.

## One-click updater

- `update-photobooth.command` (in the repo root) pulls the latest `main` and triggers the deploy workflow.  
- Before first use, save your GitHub token (with `workflow` scope) to `.github-token`.  
- Double-click the `.command` file (or create a Desktop alias) to update without opening a terminal manually.
