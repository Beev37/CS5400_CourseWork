

/* word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big  kahuna  burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
        word(determiner,Word1),
        word(noun,Word2),
        word(verb,Word3),
        word(determiner,Word4),
        word(noun,Word5). 

sentence(A,B,C,D,E). <-- query I used for ex. 2.3. */


word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e). 

crossword(Vword1,Vword2,Vword3,Hword1,Hword2,Hword3) :- 
        word(Vword1, _a, A, _b, B, _c, C, _d),
        word(Vword2, _e, E, _f, F, _g, G, _h),
        word(Vword3, _i, I, _j, J, _k, K, _l),

        word(Hword1, _m, A, _n, E, _o, I, _p),
        word(Hword2, _q, B, _r, F, _s, J, _t),
        word(Hword3, _u, C, _v, G, _w, K, _y),

        Vword1 \= Hword1, Vword1 \= Hword2, Vword1 \= Hword3,
        Vword2 \= Hword1, Vword2 \= Hword2, Vword2 \= Hword3,
        Vword3 \= Hword1, Vword3 \= Hword2, Vword3 \= Hword3,
        Vword1 \= Vword2, Vword1 \= Vword3, Vword2 \= Vword3,
        Hword1 \= Hword2, Hword1 \= Hword3, Hword2 \= Hword3.

