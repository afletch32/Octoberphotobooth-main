# October Photo Booth

## Triggering a Deploy Manually

1. Create a GitHub personal access token (classic) with `repo` and `workflow` scopes.
2. Export it in your shell before running the helper script:
   ```bash
   export GITHUB_TOKEN=ghp_yourTokenHere
   ```
3. From the project root, run:
   ```bash
   ./tools/trigger-deploy.sh [branch]
   ```
   Omit `[branch]` to use `main`. The script calls the GitHub Actions API to start the `Deploy Photobooth` workflow, which runs `npm run ship` and deploys to Cloudflare Pages.
