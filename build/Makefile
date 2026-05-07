# hexa-fusion — pandoc PDF rebuild for the 4 pillar specs.
#
# Generates the 4 pillar PDFs from the canonical .md sources via pandoc
# + xelatex. PDFs land in build/out/ and are .gitignore'd via the
# project root .gitignore.
#
# Usage:
#   make -C build check        # verify pandoc + xelatex available
#   make -C build all          # build all 4 pillar PDFs
#   make -C build fusion       # fusion (D-T) pillar only
#   make -C build tabletop     # tabletop_fusion (p-11B) pillar only
#   make -C build powerplant   # fusion_powerplant (KSTAR-N6) pillar only
#   make -C build plasma       # plasma_deep pillar only
#   make -C build verify       # run `hexa-fusion verify all` (cross-link)
#   make -C build clean        # remove build artifacts
#   make -C build size         # PDF size summary

ROOT     := ..
OUT      := out
PANDOC   := pandoc
HEADER   := header.tex
HEXA     := hexa

# CJK-aware xelatex pipeline. The header.tex include is soft-guarded —
# missing optional packages (xeCJK, titlesec) silently skip. Build-host
# without a CJK font still produces a clean ASCII-only PDF.
PANDOC_FLAGS := \
  --pdf-engine=xelatex \
  --variable=geometry:a4paper,margin=25mm \
  --variable=fontsize:11pt \
  --variable=colorlinks:true \
  --variable=linkcolor:black \
  --variable=urlcolor:blue \
  --syntax-highlighting=tango \
  --toc \
  --toc-depth=2

ifneq ($(wildcard $(HEADER)),)
  PANDOC_FLAGS += --include-in-header=$(HEADER)
endif

PDF_FUSION     := $(OUT)/fusion.pdf
PDF_TABLETOP   := $(OUT)/tabletop-fusion.pdf
PDF_POWERPLANT := $(OUT)/fusion-powerplant.pdf
PDF_PLASMA     := $(OUT)/plasma-fusion-deep.pdf

PDFS := $(PDF_FUSION) $(PDF_TABLETOP) $(PDF_POWERPLANT) $(PDF_PLASMA)

.PHONY: all clean check size fusion tabletop powerplant plasma verify

all: $(PDFS)

fusion:     $(PDF_FUSION)
tabletop:   $(PDF_TABLETOP)
powerplant: $(PDF_POWERPLANT)
plasma:     $(PDF_PLASMA)

$(OUT):
	mkdir -p $(OUT)

$(PDF_FUSION): $(ROOT)/fusion/doc/fusion.md | $(OUT)
	$(PANDOC) $(PANDOC_FLAGS) \
	  --metadata=title:"HEXA-FUSION — D-T ignition Lawson closure" \
	  --metadata=date:"2026-05-08" \
	  -o $@ $<

$(PDF_TABLETOP): $(ROOT)/tabletop_fusion/doc/tabletop-fusion.md | $(OUT)
	$(PANDOC) $(PANDOC_FLAGS) \
	  --metadata=title:"HEXA-TTF — tabletop p-11B aneutronic 1 m³" \
	  --metadata=date:"2026-05-08" \
	  -o $@ $<

$(PDF_POWERPLANT): $(ROOT)/fusion_powerplant/doc/fusion-powerplant.md | $(OUT)
	$(PANDOC) $(PANDOC_FLAGS) \
	  --metadata=title:"HEXA-FUSION-PP — KSTAR-N6 powerplant scope" \
	  --metadata=date:"2026-05-08" \
	  -o $@ $<

$(PDF_PLASMA): $(ROOT)/plasma_deep/doc/plasma-fusion-deep.md | $(OUT)
	$(PANDOC) $(PANDOC_FLAGS) \
	  --metadata=title:"HEXA-PLASMA-DEEP — plasma physics deep-dive" \
	  --metadata=date:"2026-05-08" \
	  -o $@ $<

# Cross-link to the verify pipeline. `make verify` runs the full
# hexa-fusion n=6 audit; useful pre-PDF as a regression gate.
verify:
	@echo "[build] running: hexa-fusion verify all"
	@HEXA_FUSION_ROOT=$(realpath $(ROOT)) $(HEXA) run $(ROOT)/cli/hexa-fusion.hexa verify all

clean:
	rm -rf $(OUT)

size: $(PDFS)
	@du -h $(PDFS)

check:
	@command -v $(PANDOC)  >/dev/null 2>&1 || { echo "MISSING: pandoc";  exit 1; }
	@command -v xelatex    >/dev/null 2>&1 || { echo "MISSING: xelatex"; exit 1; }
	@command -v $(HEXA)    >/dev/null 2>&1 || { echo "MISSING: hexa (install via hx install)"; exit 1; }
	@$(PANDOC) --version | head -1
	@xelatex --version | head -1
	@$(HEXA)   version    | head -1
	@echo "OK: build toolchain ready"
