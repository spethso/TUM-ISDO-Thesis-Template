# latexmk configuration -- run `latexmk` in this folder to build main.pdf
@default_files = ('main.tex');
$pdf_mode = 1;            # 1: pdflatex, 4: lualatex
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;          # run biber when needed; delete .bbl on `latexmk -c`
$clean_ext .= ' %R.bbl %R.run.xml %R.lol %R.loa %R.tdo %R.glsdefs %R.acn %R.acr %R.alg %R.synctex.gz';
