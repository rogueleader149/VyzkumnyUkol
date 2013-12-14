verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
prologues:=3;
outputtemplate:="%j-%c.eps";

beginfig(1)
	pair A[];
	A[0]:=(-1cm, -1cm);
	A[1]:=( 1cm, -1cm);
	A[2]:=( 1cm,  1cm);
	A[3]:=(-1cm,  1cm);
	A[4]:=( 0cm,  0cm);
	pair B[];
	B[0]:=(1cm, -0.1cm);
	B[1]:=(1cm,  0.1cm);
	B[2]:=(1.2cm, -0.1cm);
	B[3]:=(1.2cm,  0.1cm);
	fill A[0]--A[2]--A[3]--cycle withcolor .8 white;
	draw A[0]--A[1]--A[2]--A[3]--cycle;
	draw A[0]--A[2];
	draw A[1]--A[3];
	draw B[0]--B[2];
	draw B[1]--B[3];
	label(btex $I_0$ etex, (0.7cm, 0cm));
	label(btex $EL$ etex, (0cm, -0.7cm));
endfig;

end;