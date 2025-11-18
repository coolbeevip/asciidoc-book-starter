# AsciiDoc Book Starter

A minimal template for authoring books with AsciiDoc and Asciidoctor. The project includes a starter structure for chapters, appendices, and build targets for HTML and PDF outputs.

## Getting started
1. Ensure you have Ruby installed.
2. Install dependencies:
   ```bash
   gem install asciidoctor asciidoctor-pdf
   ```
3. Build the book:
   ```bash
   make html   # build HTML output in build/book.html
   make pdf    # build PDF output in build/book.pdf
   ```

Edit `book.adoc` to change metadata and update the chapter includes. Add or remove files in `chapters/` and `appendices/` to shape your book. Place images in `assets/images/` and reference them using the standard AsciiDoc `image::` macro.

## Project layout
- `book.adoc` — Main entry point that assembles the book.
- `chapters/` — Individual chapter files.
- `appendices/` — Supplemental material.
- `assets/images/` — Image assets referenced in the book.
- `build/` — Generated output (ignored by Git).
- `Makefile` — Simple targets for producing HTML and PDF outputs.

Feel free to extend the Makefile with additional targets (such as EPUB) or integrate with your CI system.
