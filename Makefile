NAME = a4_grid bible_grid
CLS = notebook.cls

TEX = $(addsuffix .tex, $(NAME))
AUX = $(addsuffix .aux, $(NAME))
DIV = $(addsuffix .dvi, $(NAME))
LOG = $(addsuffix .log, $(NAME))
PDF = $(addsuffix .pdf, $(NAME))

PREVIEW = ls
ifeq ($(shell uname),Darwin)
	PREVIEW = open -a Preview
else ifeq ($(shell uname -o),Cygwin)
	PREVIEW = cygstart
else ifeq ($(shell type evince > /dev/null 2>&1; echo $$?),0)
	PREVIEW = evince
else ifeq ($(shell type acroread > /dev/null 2>&1; echo $$?),0)
	PREVIEW = acroread
endif

.PHONY: all dvi pdf preview clean
all: pdf
dvi: $(DVI)
pdf: $(PDF)
preview: $(PDF)
	$(PREVIEW) $(PDF) &
clean:
	rm -f $(AUX) $(DVI) $(LOG) $(PDF)

%.dvi: %.tex $(CLS) Makefile
	platex $<
	platex $<

%.pdf: %.dvi
	dvipdfmx $<
