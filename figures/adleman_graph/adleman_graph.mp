verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
prologues:=3;
outputtemplate:="%j-%c.eps";

beginfig(1)
	
	pair G[];
	G[0]:=(0.0cm,  0.0cm);
	G[3]:=(1.0cm,  3.0cm);
	G[4]:=(4.0cm,  4.0cm);
	G[1]:=(7.0cm,  3.0cm);
	G[6]:=(8.0cm,  0.0cm);
	G[5]:=(5.5cm, -2.0cm);
	G[2]:=(2.5cm, -2.0cm);
	
	drawarrow G[0]--G[1] cutafter (fullcircle scaled .7cm shifted G[1]);
	drawarrow G[0]--G[3] cutafter (fullcircle scaled .7cm shifted G[3]);
	drawarrow G[0]--G[6] cutafter (fullcircle scaled .7cm shifted G[6]);
	drawarrow G[1]--G[3] cutafter (fullcircle scaled .7cm shifted G[3]);
	drawarrow (G[1]--G[2]) shifted (0.5mm,-0.45mm) cutafter (fullcircle scaled .7cm shifted G[2]);
	drawarrow (G[2]--G[3]) shifted (0.65mm,-0.2mm) cutafter (fullcircle scaled .7cm shifted G[3]);
	drawarrow (G[2]--G[1]) shifted (-0.5mm,0.45mm) cutafter (fullcircle scaled .7cm shifted G[1]);
	drawarrow (G[3]--G[2]) shifted (-0.65mm,0.2mm) cutafter (fullcircle scaled .7cm shifted G[2]);
	drawarrow G[3]--G[4] cutafter (fullcircle scaled .7cm shifted G[4]);
	drawarrow G[4]--G[1] cutafter (fullcircle scaled .7cm shifted G[1]);
	drawarrow G[4]--G[5] cutafter (fullcircle scaled .7cm shifted G[5]);
	drawarrow G[5]--G[1] cutafter (fullcircle scaled .7cm shifted G[1]);
	drawarrow G[5]--G[2] cutafter (fullcircle scaled .7cm shifted G[2]);
	drawarrow G[5]--G[6] cutafter (fullcircle scaled .7cm shifted G[6]);
	
	fill fullcircle scaled .7cm shifted G[0] withcolor white;
	draw fullcircle scaled .7cm shifted G[0];
	fill fullcircle scaled .7cm shifted G[1] withcolor white;
	draw fullcircle scaled .7cm shifted G[1];
	fill fullcircle scaled .7cm shifted G[2] withcolor white;
	draw fullcircle scaled .7cm shifted G[2];
	fill fullcircle scaled .7cm shifted G[3] withcolor white;
	draw fullcircle scaled .7cm shifted G[3];
	fill fullcircle scaled .7cm shifted G[4] withcolor white;
	draw fullcircle scaled .7cm shifted G[4];
	fill fullcircle scaled .7cm shifted G[5] withcolor white;
	draw fullcircle scaled .7cm shifted G[5];
	fill fullcircle scaled .7cm shifted G[6] withcolor white;
	draw fullcircle scaled .7cm shifted G[6];
	
	label(btex $v_{begin}$ etex, G[0]+(-1cm,0cm));
	label(btex $0$ etex, G[0]);
	label(btex $1$ etex, G[1]);
	label(btex $2$ etex, G[2]);
	label(btex $3$ etex, G[3]);
	label(btex $4$ etex, G[4]);
	label(btex $5$ etex, G[5]);
	label(btex $6$ etex, G[6]);
	label(btex $v_{end}$ etex, G[6]+(1cm,0cm));
	
endfig;

end;