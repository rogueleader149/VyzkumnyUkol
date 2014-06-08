defaults:
	pdflatex vyzkumak.tex
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls
	#~ pdflatex vyzkumak.tex

#~ nomencl:
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls

fig:
	cd figures/turing_tiles;\
		./tilegen.rb in1 > out1;\
		./tilegen.rb in2 > out2;\
		mpost out1;\
		mpost out2;\
		epstopdf out1-1.eps;\
		epstopdf out2-1.eps
	pdflatex vyzkumak.tex

bib:
	pdflatex vyzkumak.tex
	#~ makeindex vyzkumak.nlo -s nomencl.ist -o vyzkumak.nls
	bibtex vyzkumak.aux
	pdflatex vyzkumak.tex
