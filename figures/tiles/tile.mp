verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
prologues:=3;
outputtemplate:="%j-%c.eps";

beginfig(1)
	pair Aa[];
	Aa[0]:=(0cm, 0cm);
	Aa[1]:=(2cm, 0cm);
	Aa[2]:=(2cm, 2cm);
	Aa[3]:=(0cm, 2cm);
	Aa[4]:=(1cm, 1cm);
	pair Ba[];
	Ba[0]:=(2cm, 0.9cm);
	Ba[1]:=(2cm, 1.1cm);
	Ba[2]:=(2.2cm, 0.9cm);
	Ba[3]:=(2.2cm, 1.1cm);
	fill Aa[0]--Aa[2]--Aa[3]--cycle withcolor .8 white;
	draw Aa[0]--Aa[1]--Aa[2]--Aa[3]--cycle;
	draw Aa[0]--Aa[2];
	draw Aa[1]--Aa[3];
	draw Ba[0]--Ba[2];
	draw Ba[1]--Ba[3];
	label(btex $I_0$ etex, (1.6cm, 1.0cm));
	label(btex $EL$ etex, (1.0cm, 0.4cm));
	
	pair Ab[];
	Ab[0]:=(3cm, 0cm);
	Ab[1]:=(5cm, 0cm);
	Ab[2]:=(5cm, 2cm);
	Ab[3]:=(3cm, 2cm);
	Ab[4]:=(4cm, 1cm);
	pair Bb[];
	Bb[0]:=(3cm, 0.9cm);
	Bb[1]:=(3cm, 1.1cm);
	Bb[2]:=(2.8cm, 0.9cm);
	Bb[3]:=(2.8cm, 1.1cm);
	pair Bc[];
	Bc[0]:=(5cm, 0.9cm);
	Bc[1]:=(5cm, 1.1cm);
	Bc[2]:=(5.2cm, 0.9cm);
	Bc[3]:=(5.2cm, 1.1cm);
	fill Ab[4]--Ab[2]--Ab[3]--cycle withcolor .8 white;
	draw Ab[0]--Ab[1]--Ab[2]--Ab[3]--cycle;
	draw Ab[0]--Ab[2];
	draw Ab[1]--Ab[3];
	draw Bb[0]--Bb[2];
	draw Bb[1]--Bb[3];
	draw Bc[0]--Bc[2];
	draw Bc[1]--Bc[3];
	label(btex $I_i$ etex, (3.4cm, 1.0cm));
	label(btex $I_{i+1}$ etex, (4.6cm, 1.0cm));
	label(btex $a_{i+1}$ etex, (4.0cm, 0.4cm));
	label(btex $\ldots$ etex, (2.5cm, 1.0cm));
endfig;

end;