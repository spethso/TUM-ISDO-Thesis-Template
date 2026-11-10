# Build the thesis with latexmk (pdfLaTeX + Biber)
.PHONY: pdf lualatex watch clean purge

pdf:
	latexmk

lualatex:
	latexmk -lualatex

watch:
	latexmk -pvc

clean:
	latexmk -c

purge:
	latexmk -C
