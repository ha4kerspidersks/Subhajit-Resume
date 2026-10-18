#!/usr/bin/env bash
# ==============================================================================
# clean-build.sh — Clean LaTeX auxiliary files belonging to Subhajit-Resume
# Usage: ./scripts/clean-build.sh [--all]
#   --all: also removes the generated PDF in dist/
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIST_DIR="$PROJECT_ROOT/dist"

CLEAN_PDF=false
if [[ "${1:-}" == "--all" ]]; then
  CLEAN_PDF=true
fi

echo "=== Cleaning LaTeX auxiliary files ==="

AUX_EXTENSIONS=(
  "aux"
  "bbl"
  "blg"
  "fdb_latexmk"
  "fls"
  "log"
  "out"
  "synctex.gz"
  "toc"
  "xdv"
  "nav"
  "snm"
  "vrb"
)

# Clean root project directory auxiliary files
for ext in "${AUX_EXTENSIONS[@]}"; do
  find "$PROJECT_ROOT" -maxdepth 1 -name "*.${ext}" -type f -exec rm -f {} +
done

# Clean dist directory auxiliary files (preserving .gitkeep)
if [[ -d "$DIST_DIR" ]]; then
  for ext in "${AUX_EXTENSIONS[@]}"; do
    find "$DIST_DIR" -maxdepth 1 -name "*.${ext}" -type f -exec rm -f {} +
  done

  if [[ "$CLEAN_PDF" == true ]]; then
    rm -f "$DIST_DIR/Subhajit_Kar_Resume.pdf"
    echo "[+] Removed dist/Subhajit_Kar_Resume.pdf (--all specified)"
  fi
fi

echo "[✔] Cleanup complete. Auxiliary files removed."
