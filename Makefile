defaults:
	pdflatex vyzkumak.tex

#~ plot:
	#~ gnuplot ./figures/opt-vs-kl/plot.gnp
	#~ gnuplot ./figures/moje_funkce/plot.gnp
	#~ gnuplot ./figures/srovnani/plot.gnp
	#~ latex vyzkumak.tex
	#~ dvipdf vyzkumak.dvi

bib: defaults
	bibtex vyzkumak.aux

#~ all:
	#~ gnuplot ./figures/4-6-61/gen_figures.gnp
	#~ gnuplot ./figures/4-7-8/gen_figures.gnp
	#~ gnuplot ./figures/uprava_odhadu/gen_figures.gnp
	#~ gnuplot ./figures/params/0.2--0.81/gen_figures.gnp
	#~ gnuplot ./figures/params/0.05--0.18/gen_figures.gnp
	#~ gnuplot ./figures/opt-vs-kl/plot.gnp
	#~ gnuplot ./figures/moje_funkce/plot.gnp
	#~ gnuplot ./figures/srovnani/plot.gnp
	#~ 
	#~ latex vyzkumak.tex
	#~ bibtex vyzkumak.aux
	#~ latex vyzkumak.tex
	#~ latex vyzkumak.tex
	#~ dvipdf vyzkumak.dvi