#!/usr/bin/env bash
set -euo pipefail

publication_root="/mnt/pvc/gluster-repository-http"
packaging_root="/opt/gluster-packaging"

cd "$publication_root"
command -v node >/dev/null
command -v git >/dev/null
command -v gpg >/dev/null
command -v jq >/dev/null

test -d "$publication_root/.git"
test -z "$(git status --porcelain)"
git fetch --no-tags origin main
test "$(git rev-parse HEAD)" = "$(git rev-parse origin/main)"

test -s "$publication_root/metadata/active-generation.json"
test -s "$publication_root/metadata/catalog.json"
jq -e '.generation and .updated' "$publication_root/metadata/active-generation.json" >/dev/null
jq -e '.schema and .stable and .preview and (.packages | type == "array") and (.images | type == "array")' \
  "$publication_root/metadata/catalog.json" >/dev/null

# Reuse the packaging conductor's read-only checks without allowing builds or
# publication. The packaging checkout supplies the shared validation code.
cd "$packaging_root"
node scripts/conductor.mjs --dry-run --no-rebuild --no-publish

echo "publication validation passed"
