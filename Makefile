defaults:
	latex vyzkumak.tex
	dvipdf vyzkumak.dvi

#~ plot:
	#~ gnuplot ./plots/opt-vs-kl/plot.gnp
	#~ gnuplot ./plots/moje_funkce/plot.gnp
	#~ gnuplot ./plots/srovnani/plot.gnp
	#~ latex vyzkumak.tex
	#~ dvipdf vyzkumak.dvi

bib:
	latex vyzkumak.tex
	bibtex vyzkumak.aux
	latex vyzkumak.tex
	latex vyzkumak.tex
	dvipdf vyzkumak.dvi

#~ all:
	#~ gnuplot ./plots/4-6-61/gen_plots.gnp
	#~ gnuplot ./plots/4-7-8/gen_plots.gnp
	#~ gnuplot ./plots/uprava_odhadu/gen_plots.gnp
	#~ gnuplot ./plots/params/0.2--0.81/gen_plots.gnp
	#~ gnuplot ./plots/params/0.05--0.18/gen_plots.gnp
	#~ gnuplot ./plots/opt-vs-kl/plot.gnp
	#~ gnuplot ./plots/moje_funkce/plot.gnp
	#~ gnuplot ./plots/srovnani/plot.gnp
	#~ 
	#~ latex vyzkumak.tex
	#~ bibtex vyzkumak.aux
	#~ latex vyzkumak.tex
	#~ latex vyzkumak.tex
	#~ dvipdf vyzkumak.dvi