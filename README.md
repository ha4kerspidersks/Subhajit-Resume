# Subhajit Kar — Professional Resume

[![Build Resume PDF](https://github.com/ha4kerspidersks/Subhajit-Resume/actions/workflows/resume-build.yml/badge.svg)](https://github.com/ha4kerspidersks/Subhajit-Resume/actions/workflows/resume-build.yml)

Professional LaTeX resume for **Subhajit Kar**, Senior IAM Assistant Manager and Data Analytics Consultant.

---

## Overview

- **Source File**: [`resume.tex`](resume.tex)
- **Target PDF**: `dist/Subhajit_Kar_Resume.pdf`
- **Toolchain**: TeX Live (`pdflatex`, `latexmk`)
- **IDE**: Antigravity / VS Code with LaTeX Workshop (`James-Yu.latex-workshop`)
- **CI/CD**: GitHub Actions workflow builds the PDF on pushes and pull requests, uploading it as a downloadable artifact.

---

## Quick Start

### 1. Prerequisites

On macOS (Apple Silicon):
```bash
brew install texlive
```

Ensure the compiler is available in your PATH:
```bash
pdflatex --version
latexmk -version
```

### 2. Building the Resume

To build the resume using the automated script:
```bash
./scripts/build-resume.sh
```

The script will automatically detect `latexmk` or `pdflatex`, run the compilation passes, and produce:
```
dist/Subhajit_Kar_Resume.pdf
```

### 3. Cleaning Auxiliary Files

To remove LaTeX temporary files (`.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, etc.):
```bash
./scripts/clean-build.sh
```

To remove auxiliary files and the compiled PDF:
```bash
./scripts/clean-build.sh --all
```

---

## Editing in Antigravity / VS Code

This repository includes pre-configured settings for the **LaTeX Workshop** extension in [`.vscode/settings.json`](.vscode/settings.json):

1. Open the project folder in Antigravity:
   ```bash
   agy /Users/subhajkar/Developer/Subhajit-Resume
   ```
2. Open [`resume.tex`](resume.tex).
3. The extension automatically compiles on save and writes the output to `dist/Subhajit_Kar_Resume.pdf`.
4. Use the built-in PDF viewer tab to view the live rendering.

---

## Continuous Integration & Automated Builds

A GitHub Actions workflow is configured in [`.github/workflows/resume-build.yml`](.github/workflows/resume-build.yml):
- Runs automatically on every `push` and `pull_request` targeting `main`.
- Compiles `resume.tex` in an isolated TeX Live environment.
- Generates and uploads `dist/Subhajit_Kar_Resume.pdf` as a downloadable workflow artifact.

---

## Project Structure

```
.
├── resume.tex                 # Authoritative LaTeX resume source
├── resume.tex.original        # Verbatim original source backup
├── README.md                  # Project documentation
├── AGENTS.md                  # Autonomous agent operating directives
├── SETUP-REPORT.md            # Environment and verification audit report
├── .gitignore                 # LaTeX and editor ignore rules
├── .latexmkrc                 # LaTeXmk build options
├── .vscode/
│   └── settings.json          # LaTeX Workshop configuration
├── scripts/
│   ├── build-resume.sh        # PDF build script
│   └── clean-build.sh         # Clean intermediate files
├── dist/
│   ├── .gitkeep               # Preserves output folder in Git
│   └── Subhajit_Kar_Resume.pdf# Compiled PDF output
└── .github/
    └── workflows/
        └── resume-build.yml   # GitHub Actions build & publish workflow
```

---

## License & Attribution

Resume content © Subhajit Kar. All rights reserved.
LaTeX formatting based on clean modern resume styling.
