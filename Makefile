# Build the thesis with latexmk (pdfLaTeX + Biber)
.PHONY: pdf check lualatex watch clean purge

pdf:
	latexmk

# Build and check the log for undefined references, overfull boxes, and leftovers
check: pdf
	./scripts/check-log.sh main.log

lualatex:
	latexmk -lualatex

watch:
	latexmk -pvc

clean:
	latexmk -c

purge:
	latexmk -C
	rm -f gitinfo.tex
