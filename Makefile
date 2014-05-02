defaults:
	pdflatex vyzkumak.tex
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls
	#~ pdflatex vyzkumak.tex

#~ nomencl:
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls

bib:
	pdflatex vyzkumak.tex
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls
	bibtex vyzkumak.aux
	pdflatex vyzkumak.tex
