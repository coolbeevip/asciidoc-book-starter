ASCIIDOCTOR ?= asciidoctor
ASCIIDOCTOR_PDF ?= asciidoctor-pdf
BUILD_DIR := build
MAIN := book.adoc
HTML_OUT := $(BUILD_DIR)/book.html
PDF_OUT := $(BUILD_DIR)/book.pdf

.PHONY: html pdf clean all

all: html

$(BUILD_DIR):
mkdir -p $(BUILD_DIR)

html: $(BUILD_DIR)
$(ASCIIDOCTOR) -D $(BUILD_DIR) -o $(notdir $(HTML_OUT)) $(MAIN)

pdf: $(BUILD_DIR)
$(ASCIIDOCTOR_PDF) -D $(BUILD_DIR) -o $(notdir $(PDF_OUT)) $(MAIN)

clean:
rm -rf $(BUILD_DIR)
