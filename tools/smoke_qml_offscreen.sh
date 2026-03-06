#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

LOG_FILE="$(mktemp -t cxxqtfluentui_smoke.XXXXXX.log)"
cleanup() {
  rm -f "$LOG_FILE"
}
trap cleanup EXIT

export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-offscreen}"

PAGES=(
  "HomePage"
  "IconographyPage"
  "BasicInputPage"
  "SwitchPage"
  "RadioButtonPage"
  "SettingCardPage"
  "ComboBoxPage"
  "ColorPickerPage"
  "RatingControlPage"
  "ProgressPage"
  "BusyPage"
)

for page in "${PAGES[@]}"; do
  : >"$LOG_FILE"
  (
    set +e
    cargo run --quiet -- "$page" >"$LOG_FILE" 2>&1 &
    APP_PID="$!"

    sleep 5

    kill -TERM "$APP_PID" >/dev/null 2>&1 || true
    wait "$APP_PID" >/dev/null 2>&1 || true
  )

  if grep -E -n "ReferenceError:|TypeError:|Cannot assign|is not defined|Type Rin\\.|unavailable|Binding loop detected|Unable to assign" "$LOG_FILE" >/dev/null 2>&1; then
    echo "QML smoke test failed for page: $page (see log excerpt below)." >&2
    echo "----- log -----" >&2
    tail -n 200 "$LOG_FILE" >&2
    exit 1
  fi
done

echo "QML smoke test passed (offscreen)."
