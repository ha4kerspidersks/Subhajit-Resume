# Environment, Build & Security Setup Report — Subhajit-Resume

**Date & Time:** 2026-10-18T20:24:00+05:30  
**Project Path:** `/Users/subhajkar/Developer/Subhajit-Resume`  
**Target Repository:** `https://github.com/ha4kerspidersks/Subhajit-Resume`  

---

## 1. Environment & Architecture Audit

| Component | Detected Specification / Path | Status |
| :--- | :--- | :--- |
| **Operating System** | macOS 27.0.1 (Darwin 27.0.1 arm64) | Verified |
| **Architecture** | Apple Silicon (`arm64`) | Verified |
| **Disk Space** | 249 GiB available | Verified |
| **Antigravity CLI** | `agy` v1.3.1 (`/Users/subhajkar/.local/bin/agy`) | Verified |
| **Homebrew** | Homebrew 7.0.9 (`/opt/homebrew/bin/brew`) | Verified |
| **Git Version** | Git 2.56.0 (`/usr/bin/git`) | Verified |
| **GitHub CLI** | `gh` v2.102.0 (`/opt/homebrew/bin/gh`) | Verified |
| **GitHub Account** | Authenticated as `ha4kerspidersks` (SSH protocol, keyring) | Verified |

---

## 2. Antigravity IDE Extension Verification

- **Target Extension:** `James-Yu.latex-workshop`
- **Installed Version:** `10.13.1-universal`
- **Installation Locations:**
  - `~/.antigravity-ide/extensions/james-yu.latex-workshop-10.13.1-universal`
  - `~/.vscode/extensions/james-yu.latex-workshop-10.13.1-universal`
- **Workspace Settings:** Pre-configured in [`.vscode/settings.json`](file:///Users/subhajkar/Developer/Subhajit-Resume/.vscode/settings.json):
  - Recipes: `latexmk ➔ dist/Subhajit_Kar_Resume.pdf`, `pdflatex ➔ pdflatex (clean double-pass)`.
  - Output directory: `%DIR%/dist`.
  - Auto-build on save enabled.
  - PDF tab viewer enabled.

---

## 3. LaTeX Toolchain Installation

- **Selected Distribution:** TeX Live 2026 via Homebrew formula (`texlive 20260301_1`).
  - *Design Choice:* Installed via user-space bottle without requiring root/sudo elevation, avoiding interactive password blocks and preserving system integrity.
  - *Storage footprint:* 191,389 files, 4.6 GB in `/opt/homebrew/Cellar/texlive/20260301_1`.
- **Compiler Versions:**
  - `pdflatex`: pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026/Homebrew)
  - `latexmk`: Version 4.87
  - `kpsewhich`: Version 6.4.2
- **Required Package Verification (`kpsewhich`):**
  - `lmodern.sty`: Present (`/opt/homebrew/Cellar/texlive/.../lm/lmodern.sty`)
  - `latexsym.sty`: Present (`/opt/homebrew/Cellar/texlive/.../base/latexsym.sty`)
  - `fullpage.sty`: Present (`/opt/homebrew/Cellar/texlive/.../preprint/fullpage.sty`)
  - `titlesec.sty`: Present (`/opt/homebrew/Cellar/texlive/.../titlesec/titlesec.sty`)
  - `marvosym.sty`: Present (`/opt/homebrew/Cellar/texlive/.../marvosym/marvosym.sty`)
  - `xcolor.sty`: Present (`/opt/homebrew/Cellar/texlive/.../xcolor/xcolor.sty`)
  - `verbatim.sty`: Present (`/opt/homebrew/Cellar/texlive/.../tools/verbatim.sty`)
  - `enumitem.sty`: Present (`/opt/homebrew/Cellar/texlive/.../enumitem/enumitem.sty`)
  - `hyperref.sty`: Present (`/opt/homebrew/Cellar/texlive/.../hyperref/hyperref.sty`)
  - `fancyhdr.sty`: Present (`/opt/homebrew/Cellar/texlive/.../fancyhdr/fancyhdr.sty`)
  - `babel.sty`: Present (`/opt/homebrew/Cellar/texlive/.../generic/babel/babel.sty`)
  - `tabularx.sty`: Present (`/opt/homebrew/Cellar/texlive/.../tools/tabularx.sty`)
  - `fontawesome5.sty`: Present (`/opt/homebrew/Cellar/texlive/.../fontawesome5/fontawesome5.sty`)
  - `glyphtounicode.tex`: Present (`/opt/homebrew/Cellar/texlive/.../generic/pdftex/glyphtounicode.tex`)

---

## 4. Source Syntax Repairs & Document Layout

1. **Original Baseline Preserved:** Stored verbatim at [`resume.tex.original`](file:///Users/subhajkar/Developer/Subhajit-Resume/resume.tex.original).
2. **Package Option Clash Resolution:** Replaced redundant `\usepackage[usenames,dvipsnames]{color}` + `\usepackage{xcolor}` with `\usepackage[usenames,dvipsnames]{xcolor}`.
3. **Table Row Syntax Repair:** Fixed trailing unmatched `&` in the 11th Award item within `Awards and Certifications` by providing `& ~`.
4. **Warning Elimination:**
   - Added `\setlength{\footskip}{4pt}` to eliminate fancyhdr footskip warning.
   - Refined heading font styles to match Latin Modern font shapes without falling back.
5. **Page Geometry:** Accurately fits **exactly 1 page** without text truncation, font distortion, or margin clipping.

---

## 5. Build & PDF Validation Evidence

- **Build Command:** `./scripts/build-resume.sh`
- **Compiler:** `latexmk` with `pdflatex` backend
- **Exit Code:** `0` (Clean build, 0 errors, 0 warnings)
- **Output Artifact:** `dist/Subhajit_Kar_Resume.pdf` (279,629 bytes)
- **Page Count:** **1 page**
- **Hyperlink Audit (15 Verified Functional URLs):**
  1. `https://github.com/ha4kerspidersks`
  2. `https://www.linkedin.com/in/subhajit-kar/`
  3. `https://www.quora.com/profile/Subhajit-Kar-18`
  4. `mailto:karsubhajit2018@gmail.com`
  5. `https://drive.google.com/file/d/19i3Rzvb30tOZp4M5-Br8XT9ITQXnw0Gq/view?usp=sharing` (Live the Dot Award, Deloitte, Aug 2024)
  6. `https://drive.google.com/file/d/17mpb_3NBXssE53-he71NOsYE4gcg6fBB/view?usp=sharing` (AI Market Specialist, Deloitte, Dec 2025)
  7. `https://drive.google.com/file/d/1XjteQTQeaJEW8Z8bKWwBnWte-ba4qEmp/view?usp=sharing` (Applause Award T&T, Deloitte, Aug 2025)
  8. `https://drive.google.com/file/d/1wmrRFPrNHVczUUc12Rog62C5wAjyIXae/view?usp=sharing` (Learning Technonaut, Deloitte, Dec 2025)
  9. `https://drive.google.com/file/d/1D92iEhWPZfcTp0BsK26Et19_H67FwnQ1/view?usp=sharing` (Move the Dot - Team, Deloitte, Dec 2025)
  10. `https://drive.google.com/file/d/15QoiaAppNPWtY1s-M-P-NqDnf7whw-Om/view?usp=sharing` (Skill Badge Award, Deloitte, Dec 2025)
  11. `https://drive.google.com/file/d/1K5E0dOeuLz-0QZOucgOLjA9ENUAto0Nz/view?usp=sharing` (AI Generalist, Deloitte, Dec 2025)
  12. `https://drive.google.com/file/d/1027ZpMGeV2woOPqpQ8igSgh1twprEKVH/view?usp=sharing` (Learning Technonaut, Deloitte, Mar 2026)
  13. `https://drive.google.com/file/d/12llxExZwcz80LFY4vkCjehruFRCPmHh8/view?usp=sharing` (AI Expert, Deloitte, Dec 2025)
  14. `https://drive.google.com/file/d/1GEZSpKC3g9xLoIrJXmo-1zu_iqs-Fz2G/view?usp=sharing` (Skill Badge Award, Deloitte, Mar 2026)
  15. `https://drive.google.com/file/d/1FP_gDuUopojDAebEVyUGGBSfB-8CCr3U/view?usp=sharing` (Move the Dot - Team, Deloitte, Jun 2026)
- **Extracted Content Audit:** Full text verified via `pypdf`, containing all 10 experience bullet points with quantitative metrics, all 11 awards/certifications, education at NFSU and IEM, and 2 M.Tech research projects.

---

## 6. Security & Secret Scan

- **Scan Tool:** `gitleaks` v8.30.1
- **Command:** `gitleaks dir --no-banner .`
- **Result:**
  ```
  scanned ~33896 bytes in 9.7ms
  no leaks found
  ```
- **Secrets / Private Keys / API Tokens:** Zero detected.

---

## 7. Privacy & Public Release Audit

- **Personal Information Inspection:**
  - Phone: `+91-7908155395`
  - Email: `karsubhajit2018@gmail.com`
- **Policy Invariant:** In accordance with section 5 & 10 of the master prompt:
  > *"The supplied source includes a phone number and email address. These are personal information. Keep the original details in the local version, but before making the source and compiled PDF public, inspect both for personal contact information and other sensitive data. Do not publish those details without explicit authorization."*
- **Action:** Retained full personal details in local version. Prompting user for public repository authorization before remote push.
