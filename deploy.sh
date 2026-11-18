#!/usr/bin/env bash
# Build the site, push the source to main, and publish public/ to gh-pages.
#
# Usage:
#   ./deploy.sh "commit message"   commit all changes, push main, then deploy
#   ./deploy.sh                    deploy only (the working tree must be clean)
set -euo pipefail

cd "$(dirname "$0")"

msg="${1:-}"
branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$branch" != "main" ]; then
  echo "Error: on branch '$branch'. Switch to main before deploying." >&2
  exit 1
fi

if [ -n "$(git status --porcelain)" ] && [ -z "$msg" ]; then
  echo "Error: you have uncommitted changes:" >&2
  git status --short >&2
  echo "Pass a commit message to commit them, e.g. ./deploy.sh \"update awards\"" >&2
  exit 1
fi

if [ ! -d node_modules ]; then
  echo "==> Installing dependencies"
  npm install
fi

# Build first, so a broken site is never committed or published.
echo "==> Building"
npx hexo clean
npx hexo generate

if [ -n "$(git status --porcelain)" ]; then
  echo "==> Committing source"
  git add -A
  git commit -m "$msg"
fi

echo "==> Pushing source to origin/main"
git push origin main

echo "==> Publishing public/ to gh-pages"
npx hexo deploy --message "${msg:-Site updated: $(date '+%Y-%m-%d %H:%M:%S')}"

echo "==> Done: https://zuhdifikri.my.id"
