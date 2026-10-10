#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/apps/mobile"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK was not found on PATH. Install Flutter and retry." >&2
  exit 1
fi

for platform in android ios web; do
  if [[ -e "$APP_DIR/$platform" ]]; then
    echo "Refusing to overwrite existing $APP_DIR/$platform directory." >&2
    exit 1
  fi
done

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

flutter create --platforms=android,ios,web --project-name split_app "$TMP_DIR/split_app"

for platform in android ios web; do
  cp -R "$TMP_DIR/split_app/$platform" "$APP_DIR/$platform"
done

echo "Flutter platform runners created in apps/mobile/{android,ios,web}."
echo "Next: cd apps/mobile && flutter pub get"
