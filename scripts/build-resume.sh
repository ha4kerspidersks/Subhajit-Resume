#!/usr/bin/env bash
# ==============================================================================
# build-resume.sh — Compile LaTeX Resume to PDF
# Output: dist/Subhajit_Kar_Resume.pdf
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIST_DIR="$PROJECT_ROOT/dist"
SOURCE_FILE="$PROJECT_ROOT/resume.tex"
JOB_NAME="Subhajit_Kar_Resume"
OUTPUT_PDF="$DIST_DIR/${JOB_NAME}.pdf"

# Ensure common TeX paths are available in PATH
export PATH="/opt/homebrew/bin:/Library/TeX/texbin:/usr/local/bin:$PATH"

echo "=== Subhajit Kar Resume Build ==="
echo "Project root: $PROJECT_ROOT"
echo "Source file:  $SOURCE_FILE"
echo "Output path:  $OUTPUT_PDF"

# 1. Verify source file exists
if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "[-] ERROR: Source file not found: $SOURCE_FILE" >&2
  exit 1
fi

# 2. Ensure dist directory exists
mkdir -p "$DIST_DIR"

# 3. Locate LaTeX compiler
BUILD_TOOL=""
if command -v latexmk >/dev/null 2>&1; then
  BUILD_TOOL="latexmk"
elif command -v pdflatex >/dev/null 2>&1; then
  BUILD_TOOL="pdflatex"
else
  echo "[-] ERROR: Neither 'latexmk' nor 'pdflatex' found in PATH." >&2
  echo "    Ensure TeX Live / BasicTeX / MacTeX is installed." >&2
  echo "    Checked PATH: $PATH" >&2
  exit 1
fi

echo "[+] Using compiler: $BUILD_TOOL ($(command -v "$BUILD_TOOL"))"

# 4. Compile document
COMPILE_EXIT_CODE=0
if [[ "$BUILD_TOOL" == "latexmk" ]]; then
  echo "[+] Running latexmk..."
  cd "$PROJECT_ROOT"
  latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error \
    -outdir="$DIST_DIR" -jobname="$JOB_NAME" "$SOURCE_FILE" || COMPILE_EXIT_CODE=$?
else
  echo "[+] Running pdflatex (Pass 1)..."
  cd "$PROJECT_ROOT"
  pdflatex -interaction=nonstopmode -file-line-error \
    -output-directory="$DIST_DIR" -jobname="$JOB_NAME" "$SOURCE_FILE" || COMPILE_EXIT_CODE=$?

  if [[ $COMPILE_EXIT_CODE -eq 0 ]]; then
    echo "[+] Running pdflatex (Pass 2 - resolving references)..."
    pdflatex -interaction=nonstopmode -file-line-error \
      -output-directory="$DIST_DIR" -jobname="$JOB_NAME" "$SOURCE_FILE" || COMPILE_EXIT_CODE=$?
  fi
fi

# 5. Check compilation result
if [[ $COMPILE_EXIT_CODE -ne 0 ]]; then
  echo "[-] ERROR: Compilation failed with exit code $COMPILE_EXIT_CODE" >&2
  LOG_FILE="$DIST_DIR/${JOB_NAME}.log"
  if [[ -f "$LOG_FILE" ]]; then
    echo "--- Last 30 lines of compiler log ($LOG_FILE) ---" >&2
    tail -n 30 "$LOG_FILE" >&2
  fi
  exit "$COMPILE_EXIT_CODE"
fi

# 6. Verify generated PDF
if [[ ! -f "$OUTPUT_PDF" ]]; then
  echo "[-] ERROR: Compilation reported success, but expected PDF is missing: $OUTPUT_PDF" >&2
  exit 1
fi

FILE_SIZE=$(wc -c < "$OUTPUT_PDF" | tr -d ' ')
if [[ "$FILE_SIZE" -le 0 ]]; then
  echo "[-] ERROR: Generated PDF is empty (0 bytes): $OUTPUT_PDF" >&2
  exit 1
fi

echo "[✔] SUCCESS: Resume compiled successfully!"
echo "    PDF:  $OUTPUT_PDF"
echo "    Size: $FILE_SIZE bytes"
exit 0
