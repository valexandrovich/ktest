#!/bin/sh
set -eu

CONFIG_JS_PATH="${CONFIG_JS_PATH:-/usr/share/nginx/html/config.js}"

mkdir -p "$(dirname "$CONFIG_JS_PATH")"

{
  echo "window.__ENV__ = window.__ENV__ || {};"
  env | while IFS='=' read -r key val; do
    case "$key" in
      VITE_*)
        esc="$(printf '%s' "$val" | sed 's/\\/\\\\/g; s/\"/\\"/g')"
        echo "window.__ENV__[\"$key\"] = \"$esc\";"
        ;;
    esac
  done
} > "$CONFIG_JS_PATH"

exec nginx -g "daemon off;"
