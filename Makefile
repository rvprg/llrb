PROGRAM_NAME = llrb
FIGURES_NAME = figures
DIST_FILES = $(PROGRAM_NAME).nw $(PROGRAM_NAME).ps $(PROGRAM_NAME).pdf $(PROGRAM_NAME).scm ${FIGURES_NAME}.mp LICENSE README
ROOT_NAME = "Left-leaning Red-Black Tree implementation"

all: $(PROGRAM_NAME)

$(FIGURES_NAME).%:
	mpost $(FIGURES_NAME).mp

$(PROGRAM_NAME).scm: $(PROGRAM_NAME).nw
	notangle -R$(ROOT_NAME) $(PROGRAM_NAME).nw > $(PROGRAM_NAME).scm

$(PROGRAM_NAME).tex: $(FIGURES_NAME).%
	noweave -latex -index -delay $(PROGRAM_NAME).nw > $(PROGRAM_NAME).tex

$(PROGRAM_NAME).dvi: $(PROGRAM_NAME).tex
	latex -quiet $(PROGRAM_NAME).tex && latex -quiet $(PROGRAM_NAME).tex

$(PROGRAM_NAME).ps: $(PROGRAM_NAME).dvi
	dvips -q* $(PROGRAM_NAME).dvi

$(PROGRAM_NAME).pdf: $(PROGRAM_NAME).ps
	ps2pdf $(PROGRAM_NAME).ps

dist:
	tar -cf $(PROGRAM_NAME).tar $(DIST_FILES) Makefile && gzip $(PROGRAM_NAME).tar

clean:
	-rm -f $(FIGURES_NAME).{1..7} $(FIGURES_NAME).{log,mpx} $(PROGRAM_NAME).{log,tex,aux,dvi,ps,pdf}

$(PROGRAM_NAME): $(DIST_FILES)


