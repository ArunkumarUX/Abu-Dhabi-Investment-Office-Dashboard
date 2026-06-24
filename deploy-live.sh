#!/bin/bash
# Deploy latest dashboard to Netlify production
set -e
cd "$(dirname "$0")"
echo "→ Deploying ADIO Intelligence Dashboard to Netlify..."
if ! command -v netlify >/dev/null 2>&1; then
  echo "Install Netlify CLI: npm install -g netlify-cli"
  exit 1
fi
if [ ! -d .netlify ]; then
  echo "→ Linking to site adio-intelligence-dashboard (browser may open)..."
  netlify link --name adio-intelligence-dashboard
fi
netlify deploy --prod --dir=. --functions=netlify/functions --no-build
echo "✓ Live at https://adio-intelligence-dashboard.netlify.app/"
