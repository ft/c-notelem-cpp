SLIDES = c-is-not-a-subset-of-c++.pdf
SOURCE = ${SLIDES:.pdf=.tex}

LATEX = pdflatex
INKSCAPE = inkscape
SVG2PDF = $(INKSCAPE) --export-pdf

GRAPHICS_SVG = ./graphics/csubset.svg
GRAPHICS_PDF = ${GRAPHICS_SVG:.svg=.pdf}

.SUFFIXES: .svg .pdf
.svg.pdf:
	$(SVG2PDF) $@ $<

all: $(SLIDES)

clean:
	rm -f *~ .*~
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb
	rm -f $(GRAPHICS_PDF)

squeaky: clean
	rm -f $(SLIDES)

$(SLIDES): $(SOURCE) $(GRAPHICS_PDF)
	$(LATEX) $(SOURCE)

.PHONY: all clean squeaky
