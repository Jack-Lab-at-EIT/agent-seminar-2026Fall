$pdf_mode = 1;
$pdf_previewer = 'sioyek';
$pdflatex = 'xelatex -interaction=nonstopmode -halt-on-error';

$do_cd = 1;

# Send every generated file (aux/log/pdf/...) to <repo>/build, so source
# directories hold only hand-written files.  $do_cd above makes latexmk run
# from the .tex file's directory, hence '../build'.
$out_dir = '../build';

$clean_ext = '%R.fdb_latexmk %R.fls %R.typ';
