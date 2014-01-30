verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
prologues:=3;
outputtemplate:="%j-%c.eps";

beginfig(1)
	
	label(btex $\mathtt{\ldots|CTTTCGAATA\;AAGATCAGTC|\ldots}$ etex, (0cm, .4cm));
	label(btex $\mathtt{\ldots|CCTCTCGCGA\;GAAAGCTTAT|TTCTAGTCAG\;CACTCTTTGT|\ldots}$ etex, origin);
	
	label(btex $O_i$ etex, (-1.9cm, -.6cm));
	label(btex $O_j$ etex, ( 2.0cm, -.6cm));
	label(btex $O_{i\rightarrow j}$ etex, (0cm, 1cm));
	
	label(btex $5'\rightarrow$ etex, (-5cm, .5mm));
	label(btex $3'\leftarrow$ etex, (-5cm, .4cm));
	label(btex $\rightarrow 3'$ etex, ( 5cm, .5mm));
	label(btex $\leftarrow 5'$ etex, ( 5cm, .4cm));
	
endfig;

end;
