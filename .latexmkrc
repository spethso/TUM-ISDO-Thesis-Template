# latexmk configuration -- run `latexmk` in this folder to build main.pdf
@default_files = ('main.tex');
$pdf_mode = 1;            # 1: pdflatex, 4: lualatex
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;          # run biber when needed; delete .bbl on `latexmk -c`
$clean_ext .= ' %R.bbl %R.run.xml %R.lol %R.loa %R.tdo %R.glsdefs %R.acn %R.acr %R.alg %R.synctex.gz';

# Do not wrap lines in the log file, so that scripts/check-log.sh finds all problems
$ENV{'max_print_line'} = 10000;

# Write the current git commit to gitinfo.tex. The draft version shows it in the footer,
# so that feedback rounds can be told apart. "+" marks uncommitted changes. Without git
# (e.g., on Overleaf), the footer only shows the date.
{
  my $commit = `git rev-parse --short HEAD 2>/dev/null`;
  chomp $commit;
  if ($commit ne '') {
    my $changes = `git status --porcelain --untracked-files=no 2>/dev/null`;
    $commit .= '+' if $changes ne '';
  }
  my $content = "\\def\\TUMgitcommit{$commit}\n";
  my $old = '';
  if (open(my $in, '<', 'gitinfo.tex')) { local $/; $old = <$in>; close($in); }
  if ($old ne $content && open(my $out, '>', 'gitinfo.tex')) { print $out $content; close($out); }
}
