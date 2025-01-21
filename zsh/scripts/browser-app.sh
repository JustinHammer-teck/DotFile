#!/bin/bash

APPS_DIR="/Applications"

check_web_capability() {
  local plist_path="$1/Contents/Info.plist"

  if [[ -f "$plist_path" ]]; then
    if plutil -extract CFBundleURLTypes raw "$plist_path" 2>/dev/null | grep -E 'NSUserActivityTypeBrowsingWeb' "$plist_path" >/dev/null; then
      app_name=$(defaults read "${1}/Contents/Info" CFBundleName 2>/dev/null || basename "$1")
      echo "$app_name"
    fi
  fi
}

find "$APPS_DIR" -name "*.app" -type d -maxdepth 1 | while read -r app; do
  check_web_capability "$app"
done
