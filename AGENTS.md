# AGENTS.md — Subhajit-Resume Project Directives

This repository contains the LaTeX source code, automation scripts, and GitHub Actions CI configuration for **Subhajit Kar's Resume**.

## 1. Core Operating Principles

1. **Source of Truth**:
   - `resume.tex` is the single authoritative source of truth for all resume content.
   - Never edit generated PDFs, intermediate `.aux` files, or temporary files directly.

2. **Factual Integrity & Anti-Hallucination**:
   - **Never fabricate** achievements, metrics, awards, employment dates, or credentials.
   - Preserve all numerical metrics (e.g., 300K+ identities/month, 80–90% reduction, 250+ ServiceNow RITMs, 9 global regions, 11 Deloitte awards/certifications).
   - Preserve all verified credential links (Google Drive URLs, LinkedIn, GitHub, Quora).
   - Never replace unverified links with fabricated URLs.

3. **Privacy & Public Release Gate**:
   - The local `resume.tex` contains verified contact details (phone and email).
   - Before committing or pushing to any public repository, verify whether the user has authorized publishing raw personal contact information or requested public placeholders.
   - Never commit API keys, personal access tokens, private keys, or `.env` files.

4. **Zero Collateral Damage**:
   - Confine all changes strictly to `/Users/subhajkar/Developer/Subhajit-Resume`.
   - Never modify or delete files in other repositories (e.g., `LinkedIn-Audit`, `subhajitportfolio-2.0`).
   - Do not commit auxiliary LaTeX files (`.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, `.synctex.gz`).
   - Preserve `dist/.gitkeep`.

5. **Mandatory Build Verification**:
   - Run `./scripts/build-resume.sh` after every substantive edit to `resume.tex`.
   - Never claim a resume edit is complete until the compiler exits with code `0`, `dist/Subhajit_Kar_Resume.pdf` is generated, and the PDF is verified to be non-empty and formatted properly.

## 2. Project Architecture & Directory Layout

```
~/Developer/Subhajit-Resume/
├── resume.tex                 # Authoritative LaTeX resume source
├── resume.tex.original        # Verbatim backup of initial supplied source
├── README.md                  # Developer & usage documentation
├── AGENTS.md                  # Agent operating directives (this file)
├── SETUP-REPORT.md            # Environment, build, and validation audit log
├── .gitignore                 # LaTeX auxiliary & OS file exclusions
├── .latexmkrc                 # LaTeXmk reproducible build configuration
├── .vscode/
│   └── settings.json          # LaTeX Workshop extension integration
├── scripts/
│   ├── build-resume.sh        # PDF compilation script (pdflatex / latexmk)
│   └── clean-build.sh         # Auxiliary file cleanup script
├── dist/
│   ├── .gitkeep               # Git anchor for output directory
│   └── Subhajit_Kar_Resume.pdf# Generated resume PDF (gitignored by default)
└── .github/
    └── workflows/
        └── resume-build.yml   # GitHub Actions automated CI build & artifact upload
```

## 3. Essential Commands

### Build PDF
```bash
./scripts/build-resume.sh
```
Compiles `resume.tex` into `dist/Subhajit_Kar_Resume.pdf`.

### Clean Auxiliary Files
```bash
./scripts/clean-build.sh       # Cleans .aux, .log, .out, etc.
./scripts/clean-build.sh --all # Also removes generated PDF in dist/
```

### Manual TeX Compilation
```bash
latexmk -pdf -outdir=dist -jobname=Subhajit_Kar_Resume resume.tex
# Or with pdflatex:
pdflatex -interaction=nonstopmode -output-directory=dist -jobname=Subhajit_Kar_Resume resume.tex
```

## 4. IDE Integration (Antigravity & LaTeX Workshop)
- The extension `James-Yu.latex-workshop` is configured in `.vscode/settings.json`.
- Saving `resume.tex` automatically triggers compilation to `dist/Subhajit_Kar_Resume.pdf`.
- PDF viewer is set to tab preview inside the IDE.
