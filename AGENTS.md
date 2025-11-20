# Repository Guidelines

## Project Structure & Module Organization
Book content lives in `book/`, with `index.adoc` orchestrating `preface.adoc`, `foreword.adoc`, and per-chapter directories like `chapter-02-The-Rocket/` that bundle `content.adoc` plus chapter-specific images. Shared assets sit under `book/images/`, `book/fonts/`, and `book/themes/`, so always co-locate new media there. Automation scripts at the repo root (`create-book-*.sh`, `.bat`) invoke Dockerized Asciidoctor builds, while `interactive-asciidoctor-shell.*` launches a debugging shell. UI automation and helper tooling live in `tooling/` (Playwright config, `src/`, and package metadata).

## Build, Test, and Development Commands
- `./create-book-pdf.sh basic` (or `dark`): render the book to `book/index.pdf` using the selected theme via Docker.
- `./create-book-epub.sh`: produce `book/index.epub` when you need an e-reader artifact.
- `./interactive-asciidoctor-shell.sh`: drop into the container for ad-hoc `asciidoctor` commands or theme tweaks.
- `npm install --prefix tooling`: install Playwright and ancillary tooling deps.
- `npm run build --prefix tooling` (runs `npx playwright test`): execute UI/image regression tests defined in `tooling/src` and fail fast on broken snippets.

## Coding Style & Naming Conventions
AsciiDoc files should remain UTF-8, use sentence-style headings, and favor one sentence per line for easier diffs. Inline code and attributes (for example `{author}` or `` `fastify.listen()` ``) stay in English; surrounding prose uses Simplified Chinese. New chapters follow the `chapter-XX-Descriptive-Title/` pattern with Title Case slugs and hyphen separators. Shell scripts are POSIX-compatible; keep two-space indentation for AsciiDoc lists and avoid tab characters throughout.

## Testing Guidelines
Playwright is the only automated test runner; keep scenarios near the related assets in `tooling/src`. Name tests after the output they validate (e.g., `pdf-theme.spec.ts`) and assert for both light/dark themes when practical. Before opening a pull request, run `npm run build --prefix tooling` plus at least one PDF generation command to confirm fonts and localized glyphs render correctly.

## Commit & Pull Request Guidelines
Follow the terse, imperative style visible in `git log` (e.g., `Add alternative toolchains for AsciiDoc builds`). Each commit should isolate a logical change: translate prose, update assets, or adjust tooling—not all at once. Pull requests should describe the affected chapters/scripts, call out localization nuances, and attach screenshots or generated PDFs when visual output changes. Link issues when available and note any manual QA (commands run, tests skipped) so reviewers can reproduce results quickly.
