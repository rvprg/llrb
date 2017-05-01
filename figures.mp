prologues := 2;

\input boxes
beginfig(1)

def draw_node (expr A, t) (suffix name)=
   circleit.name(t); name.c = A; drawboxed(name);
enddef;

def draw_subtree (expr A, t) (suffix name)=
  z0=(0cm, 0cm); z1=(-0.5cm, -1.0cm); z2=(0.5cm, -1.0cm);
  pair name.c;
  name.c :=.5[z1,z2] shifted A; path name; name:=z0--z1--z2--cycle;
  label.top(t, name.c); draw name shifted A;
enddef;

def get_pos (expr p, tw, th, s)= p + (s*tw, -th); enddef;

tw = .8cm;
shrink = .8;

pair rootpos,leftsubtreepos,rightsubtreepos,rrightsubstreepos,lleftsubstreepos;
rootpos := (2.5cm, 3cm);
leftsubtreepos := get_pos(rootpos, tw*1.7, tw, -1);
lleftsubstreepos := get_pos(leftsubtreepos, tw*shrink, tw*shrink, -1);
rrightsubstreepos := get_pos(leftsubtreepos, tw*shrink, tw*shrink, +1);
rightsubtreepos := get_pos(rootpos, tw*shrink, tw*shrink, +1);

pickup pencircle scaled 1pt;

draw_node(rootpos, btex \strut$x$ etex, keyx);
draw keyx.s..(xpart rootpos, 0) dashed withdots;
label.bot(btex $x$ etex, (xpart rootpos, 0));

draw_node(leftsubtreepos, btex \strut$y$ etex, keyy);
draw keyy.s..(xpart leftsubtreepos, 0) dashed withdots;
label.bot(btex $y$ etex, (xpart leftsubtreepos, 0));

linecap := butt;
draw keyx.c..keyy.c cutbefore bpath.keyx cutafter bpath.keyy withpen pencircle scaled 3pt;
linecap := rounded;

draw_subtree(lleftsubstreepos, btex $\alpha$ etex, C);
draw C.c..(xpart C.c, 0) dashed withdots;
label.bot(btex $\alpha$ etex, (xpart C.c, 0));

draw_subtree(rrightsubstreepos, btex $\beta$ etex, D);
draw D.c..(xpart D.c, 0) dashed withdots;
label.bot(btex $\beta$ etex, (xpart D.c, 0));

draw_subtree(rightsubtreepos, btex $\gamma$ etex, E);
draw E.c..(xpart E.c, 0) dashed withdots;
label.bot(btex $\gamma$ etex, (xpart E.c, 0));

draw keyy.c..lleftsubstreepos cutbefore bpath.keyy;
draw keyy.c..rrightsubstreepos cutbefore bpath.keyy;
draw keyx.c..rightsubtreepos cutbefore bpath.keyx;

rootpos := rootpos shifted (5.5cm, 0cm);
leftsubtreepos := get_pos(rootpos, tw*shrink, tw*shrink, -1);
rightsubtreepos := get_pos(rootpos,  tw*1.7, tw, +1);
lleftsubstreepos := get_pos(rightsubtreepos, tw*shrink, tw*shrink, -1);
rrightsubstreepos := get_pos(rightsubtreepos, tw*shrink, tw*shrink, +1);

draw_node(rootpos, btex \strut$y$ etex, nkeyx);
draw nkeyx.s..(xpart rootpos, 0) dashed withdots;
label.bot(btex $y$ etex, (xpart rootpos, 0));

draw_node(rightsubtreepos, btex \strut$x$ etex, nkeyy);
draw nkeyy.s..(xpart rightsubtreepos, 0) dashed withdots;
label.bot(btex $x$ etex, (xpart rightsubtreepos, 0));

linecap := butt;
draw nkeyx.c..nkeyy.c cutbefore bpath.nkeyx cutafter bpath.nkeyy  withpen pencircle scaled 3pt;
linecap := rounded;

draw_subtree(leftsubtreepos, btex $\alpha$ etex, H);
draw H.c..(xpart leftsubtreepos, 0) dashed withdots;
label.bot(btex $\alpha$ etex, (xpart leftsubtreepos, 0));

draw_subtree(lleftsubstreepos, btex $\beta$ etex, I);
draw I.c..(xpart lleftsubstreepos, 0) dashed withdots;
label.bot(btex $\beta$ etex, (xpart lleftsubstreepos, 0));

draw_subtree(rrightsubstreepos, btex $\gamma$ etex, J);
draw J.c..(xpart rrightsubstreepos, 0) dashed withdots;
label.bot(btex $\gamma$ etex, (xpart rrightsubstreepos, 0));

draw nkeyx.c..leftsubtreepos cutbefore bpath.nkeyx;
draw nkeyy.c..lleftsubstreepos cutbefore bpath.nkeyy;
draw nkeyy.c..rrightsubstreepos cutbefore bpath.nkeyy;

drawarrow (keyx.c shifted (1cm, 0))..(nkeyx.c shifted (-1cm, 0));
label.top(btex Rotate right etex, .5[keyx.c,nkeyx.c]);
drawarrow reverse((keyx.c shifted (1cm, -2.6cm))..(nkeyx.c shifted (-1cm, -2.6cm)));
label.bot(btex Rotate left etex, .5[keyx.c,nkeyx.c] shifted (0, -2.6cm));

endfig;

beginfig(2)
pickup pencircle scaled 1pt;
interim defaultdx:= .25cm;

boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.b(btex \strut$b$ etex);
boxit.d(btex \strut$d$ etex);
drawboxed(b, d);

boxjoin();
boxit.a(btex \strut$a$ etex);
a.ne = b.sw - (0cm, .5cm);
boxit.c(btex \strut$c$ etex);
c.n = b.se - (.1cm, .5cm);
drawboxed(a, c);

draw b.sw..a.n;
draw b.se..c.n;

boxit.dd(btex \strut$d$ etex);
dd.c = d.e + (4cm, 0cm);
drawboxed(dd);

boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.aa(btex \strut$a$ etex);
boxit.bb(btex \strut$b$ etex);
boxit.cc(btex \strut$c$ etex);
bb.ne = dd.sw - (.1cm, .5cm);
drawboxed(aa, bb, cc);
draw dd.sw..bb.n;

drawarrow (d.e shifted (1cm, 0))..(dd.w shifted (-1cm, 0));
label.top(btex Merge etex, .5[d.c,dd.c]);

endfig;

beginfig(3)
pickup pencircle scaled 1pt;
interim defaultdx:= .25cm;

boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.b(btex \strut$b$ etex);
boxit.e(btex \strut$e$ etex);
drawboxed(b, e);

boxjoin();
boxit.a(btex \strut$a$ etex);
a.ne = b.sw - (0cm, .5cm);
drawboxed(a);

boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.c(btex \strut$c$ etex);
boxit.d(btex \strut$d$ etex);
c.ne = b.se - (-.2cm, .5cm);
drawboxed(c, d);

draw b.sw..a.n;
draw b.se..c.ne;

boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.cc(btex \strut$c$ etex);
boxit.ee(btex \strut$e$ etex);
cc.c = e.e + (4cm, 0cm);
drawboxed(cc, ee);

boxjoin();
boxit.aa(btex \strut$a$ etex);
boxit.bb(btex \strut$b$ etex);
aa.ne = ee.sw - (1cm, .5cm);
aa.se = bb.sw;
drawboxed(aa, bb);

boxit.dd(btex \strut$d$ etex);
dd.n = ee.sw + (.2cm, -.5cm);
drawboxed(dd);

draw cc.sw..aa.ne;
draw cc.se..dd.n;

drawarrow (e.e shifted (1cm, 0))..(cc.w shifted (-1cm, 0));
label.top(btex Borrow from sibling etex, .5[e.c,cc.c]);

endfig;

def draw_tree=
for i=0 upto N:
        pickup pencircle scaled 5pt;
        drawdot (i*w, -d[i]*h);
        pickup pencircle scaled 1pt;
        if (p[i] <= N): 
                if (c[i]=1): drawoptions(dashed withdots scaled 0.3); else: drawoptions(); fi;
                draw (i*w, -d[i]*h)--(p[i]*w, -d[p[i]]*h);
        fi;
endfor;
enddef;

beginfig(4)
numeric N, w, h;
w := .1cm;
h := .5cm;
N := 15;
numeric d[], p[], c[];
d0 := 3; p0 := 1; c0:=0;
d1 := 2; p1 := 3; c1:=0;
d2 := 3; p2 := 1; c2:=0;
d3 := 1; p3 := 8; c3:=0;
d4 := 4; p4 := 5; c4:=1;
d5 := 3; p5 := 6; c5:=0;
d6 := 2; p6 := 3; c6:=0;
d7 := 3; p7 := 6; c7:=0;
d8 := 0; p8 := 16; c8:=0;
d9 := 3; p9 := 10; c9:=0;
d10 := 2; p10 := 12; c10:=0;
d11 := 3; p11 := 10; c11:=0;
d12 := 1; p12 := 8; c12:=0;
d13 := 3; p13 := 14; c13:=0;
d14 := 2; p14 := 12; c14:=0;
d15 := 3; p15 := 14; c15:=0;
draw_tree;
endfig;

beginfig(5)
numeric N, w, h;
w := .1cm;
h := .5cm;
N := 31;
numeric d[], p[], c[];
d0 := 5; p0 := 1; c0:=0;
d1 := 4; p1 := 3; c1:=1;
d2 := 5; p2 := 1; c2:=0;
d3 := 3; p3 := 5; c3:=0;
d4 := 4; p4 := 3; c4:=0;
d5 := 2; p5 := 11; c5:=0;
d6 := 5; p6 := 7; c6:=0;
d7 := 4; p7 := 9; c7:=1;
d8 := 5; p8 := 7; c8:=0;
d9 := 3; p9 := 5; c9:=0;
d10 := 4; p10 := 9; c10:=0;
d11 := 1; p11 := 22; c11:=1;
d12 := 5; p12 := 13; c12:=0;
d13 := 4; p13 := 15; c13:=1;
d14 := 5; p14 := 13; c14:=0;
d15 := 3; p15 := 17; c15:=0;
d16 := 4; p16 := 15; c16:=0;
d17 := 2; p17 := 11; c17:=0;
d18 := 4; p18 := 19; c18:=0;
d19 := 3; p19 := 17; c19:=0;
d20 := 5; p20 := 21; c20:=1;
d21 := 4; p21 := 19; c21:=0;
d22 := 0; p22 := 32; c22:=0;
d23 := 3; p23 := 24; c23:=0;
d24 := 2; p24 := 27; c24:=0;
d25 := 4; p25 := 26; c25:=1;
d26 := 3; p26 := 24; c26:=0;
d27 := 1; p27 := 22; c27:=0;
d28 := 4; p28 := 29; c28:=1;
d29 := 3; p29 := 30; c29:=0;
d30 := 2; p30 := 27; c30:=0;
d31 := 3; p31 := 30; c31:=0;
draw_tree;
endfig;

beginfig(6)
numeric N, w, h;
w := .1cm;
h := .5cm;
N := 63;
numeric d[], p[], c[];
d0 := 6; p0 := 1; c0:=0;
d1 := 5; p1 := 4; c1:=1;
d2 := 7; p2 := 3; c2:=1;
d3 := 6; p3 := 1; c3:=0;
d4 := 4; p4 := 6; c4:=0;
d5 := 5; p5 := 4; c5:=0;
d6 := 3; p6 := 13; c6:=0;
d7 := 7; p7 := 8; c7:=1;
d8 := 6; p8 := 9; c8:=0;
d9 := 5; p9 := 11; c9:=1;
d10 := 6; p10 := 9; c10:=0;
d11 := 4; p11 := 6; c11:=0;
d12 := 5; p12 := 11; c12:=0;
d13 := 2; p13 := 26; c13:=1;
d14 := 5; p14 := 15; c14:=0;
d15 := 4; p15 := 18; c15:=0;
d16 := 6; p16 := 17; c16:=1;
d17 := 5; p17 := 15; c17:=0;
d18 := 3; p18 := 13; c18:=0;
d19 := 7; p19 := 20; c19:=1;
d20 := 6; p20 := 21; c20:=0;
d21 := 5; p21 := 23; c21:=1;
d22 := 6; p22 := 21; c22:=0;
d23 := 4; p23 := 18; c23:=0;
d24 := 6; p24 := 25; c24:=1;
d25 := 5; p25 := 23; c25:=0;
d26 := 1; p26 := 36; c26:=0;
d27 := 4; p27 := 28; c27:=0;
d28 := 3; p28 := 30; c28:=0;
d29 := 4; p29 := 28; c29:=0;
d30 := 2; p30 := 26; c30:=0;
d31 := 5; p31 := 32; c31:=0;
d32 := 4; p32 := 34; c32:=1;
d33 := 5; p33 := 32; c33:=0;
d34 := 3; p34 := 30; c34:=0;
d35 := 4; p35 := 34; c35:=0;
d36 := 0; p36 := 64; c36:=0;
d37 := 5; p37 := 38; c37:=0;
d38 := 4; p38 := 40; c38:=1;
d39 := 5; p39 := 38; c39:=0;
d40 := 3; p40 := 42; c40:=0;
d41 := 4; p41 := 40; c41:=0;
d42 := 2; p42 := 49; c42:=0;
d43 := 5; p43 := 44; c43:=0;
d44 := 4; p44 := 46; c44:=1;
d45 := 5; p45 := 44; c45:=0;
d46 := 3; p46 := 42; c46:=0;
d47 := 5; p47 := 48; c47:=1;
d48 := 4; p48 := 46; c48:=0;
d49 := 1; p49 := 36; c49:=0;
d50 := 5; p50 := 51; c50:=0;
d51 := 4; p51 := 53; c51:=0;
d52 := 5; p52 := 51; c52:=0;
d53 := 3; p53 := 60; c53:=1;
d54 := 6; p54 := 55; c54:=0;
d55 := 5; p55 := 58; c55:=1;
d56 := 7; p56 := 57; c56:=1;
d57 := 6; p57 := 55; c57:=0;
d58 := 4; p58 := 53; c58:=0;
d59 := 5; p59 := 58; c59:=0;
d60 := 2; p60 := 49; c60:=0;
d61 := 4; p61 := 62; c61:=0;
d62 := 3; p62 := 60; c62:=0;
d63 := 4; p63 := 62; c63:=0;
draw_tree;
endfig;

beginfig(7)
numeric N, w, h;
w := .1cm;
h := .5cm;
N := 127;
numeric d[], p[], c[];
d0 := 8; p0 := 1; c0:=1;
d1 := 7; p1 := 2; c1:=0;
d2 := 6; p2 := 5; c2:=0;
d3 := 8; p3 := 4; c3:=1;
d4 := 7; p4 := 2; c4:=0;
d5 := 5; p5 := 9; c5:=1;
d6 := 7; p6 := 7; c6:=0;
d7 := 6; p7 := 5; c7:=0;
d8 := 7; p8 := 7; c8:=0;
d9 := 4; p9 := 13; c9:=0;
d10 := 6; p10 := 11; c10:=0;
d11 := 5; p11 := 9; c11:=0;
d12 := 6; p12 := 11; c12:=0;
d13 := 3; p13 := 24; c13:=1;
d14 := 8; p14 := 15; c14:=1;
d15 := 7; p15 := 16; c15:=0;
d16 := 6; p16 := 18; c16:=1;
d17 := 7; p17 := 16; c17:=0;
d18 := 5; p18 := 20; c18:=0;
d19 := 6; p19 := 18; c19:=0;
d20 := 4; p20 := 13; c20:=0;
d21 := 6; p21 := 22; c21:=0;
d22 := 5; p22 := 20; c22:=0;
d23 := 6; p23 := 22; c23:=0;
d24 := 2; p24 := 39; c24:=0;
d25 := 7; p25 := 26; c25:=0;
d26 := 6; p26 := 29; c26:=1;
d27 := 8; p27 := 28; c27:=1;
d28 := 7; p28 := 26; c28:=0;
d29 := 5; p29 := 31; c29:=0;
d30 := 6; p30 := 29; c30:=0;
d31 := 4; p31 := 35; c31:=1;
d32 := 6; p32 := 33; c32:=0;
d33 := 5; p33 := 31; c33:=0;
d34 := 6; p34 := 33; c34:=0;
d35 := 3; p35 := 24; c35:=0;
d36 := 5; p36 := 37; c36:=0;
d37 := 4; p37 := 35; c37:=0;
d38 := 5; p38 := 37; c38:=0;
d39 := 1; p39 := 66; c39:=0;
d40 := 6; p40 := 41; c40:=0;
d41 := 5; p41 := 44; c41:=0;
d42 := 7; p42 := 43; c42:=1;
d43 := 6; p43 := 41; c43:=0;
d44 := 4; p44 := 48; c44:=1;
d45 := 6; p45 := 46; c45:=0;
d46 := 5; p46 := 44; c46:=0;
d47 := 6; p47 := 46; c47:=0;
d48 := 3; p48 := 54; c48:=0;
d49 := 6; p49 := 50; c49:=0;
d50 := 5; p50 := 52; c50:=1;
d51 := 6; p51 := 50; c51:=0;
d52 := 4; p52 := 48; c52:=0;
d53 := 5; p53 := 52; c53:=0;
d54 := 2; p54 := 39; c54:=0;
d55 := 7; p55 := 56; c55:=1;
d56 := 6; p56 := 57; c56:=0;
d57 := 5; p57 := 60; c57:=1;
d58 := 7; p58 := 59; c58:=1;
d59 := 6; p59 := 57; c59:=0;
d60 := 4; p60 := 62; c60:=0;
d61 := 5; p61 := 60; c61:=0;
d62 := 3; p62 := 54; c62:=0;
d63 := 5; p63 := 64; c63:=0;
d64 := 4; p64 := 62; c64:=0;
d65 := 5; p65 := 64; c65:=0;
d66 := 0; p66 := 128; c66=0;
d67 := 7; p67 := 68; c67:=1;
d68 := 6; p68 := 69; c68:=0;
d69 := 5; p69 := 71; c69:=1;
d70 := 6; p70 := 69; c70:=0;
d71 := 4; p71 := 73; c71:=0;
d72 := 5; p72 := 71; c72:=0;
d73 := 3; p73 := 77; c73:=0;
d74 := 5; p74 := 75; c74:=0;
d75 := 4; p75 := 73; c75:=0;
d76 := 5; p76 := 75; c76:=0;
d77 := 2; p77 := 88; c77:=0;
d78 := 6; p78 := 79; c78:=1;
d79 := 5; p79 := 80; c79:=0;
d80 := 4; p80 := 83; c80:=0;
d81 := 6; p81 := 82; c81:=1;
d82 := 5; p82 := 80; c82:=0;
d83 := 3; p83 := 77; c83:=0;
d84 := 5; p84 := 85; c84:=0;
d85 := 4; p85 := 83; c85:=0;
d86 := 6; p86 := 87; c86:=1;
d87 := 5; p87 := 85; c87:=0;
d88 := 1; p88 := 66; c88:=0;
d89 := 8; p89 := 90; c89:=1;
d90 := 7; p90 := 91; c90:=0;
d91 := 6; p91 := 93; c91:=1;
d92 := 7; p92 := 91; c92:=0;
d93 := 5; p93 := 95; c93:=0;
d94 := 6; p94 := 93; c94:=0;
d95 := 4; p95 := 102; c95:=0;
d96 := 7; p96 := 97; c96:=0;
d97 := 6; p97 := 99; c97:=1;
d98 := 7; p98 := 97; c98:=0;
d99 := 5; p99 := 95; c99:=0;
d100 := 7; p100 := 101; c100:=1;
d101 := 6; p101 := 99; c101:=0;
d102 := 3; p102 := 110; c102:=1;
d103 := 6; p103 := 104; c103:=0;
d104 := 5; p104 := 106; c104:=0;
d105 := 6; p105 := 104; c105:=0;
d106 := 4; p106 := 102; c106:=0;
d107 := 6; p107 := 108; c107:=0;
d108 := 5; p108 := 106; c108:=0;
d109 := 6; p109 := 108; c109:=0;
d110 := 2; p110 := 88; c110:=0;
d111 := 8; p111 := 112; c111:=1;
d112 := 7; p112 := 113; c112:=0;
d113 := 6; p113 := 115; c113:=1;
d114 := 7; p114 := 113; c114:=0;
d115 := 5; p115 := 117; c115:=0;
d116 := 6; p116 := 115; c116:=0;
d117 := 4; p117 := 121; c117:=1;
d118 := 6; p118 := 119; c118:=0;
d119 := 5; p119 := 117; c119:=0;
d120 := 6; p120 := 119; c120:=0;
d121 := 3; p121 := 110; c121:=0;
d122 := 7; p122 := 123; c122:=1;
d123 := 6; p123 := 124; c123:=0;
d124 := 5; p124 := 126; c124:=1;
d125 := 6; p125 := 124; c125:=0;
d126 := 4; p126 := 121; c126:=0;
d127 := 5; p127 := 126; c127:=0;
draw_tree;
endfig;

end;
