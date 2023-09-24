% Book Exercise: 2.3


wordd(determiner,a).
wordd(determiner,every).
wordd(noun,criminal).
wordd(noun,'big  kahuna  burger').
wordd(verb,eats).
wordd(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
        wordd(determiner,Word1),
        wordd(noun,Word2),
        wordd(verb,Word3),
        wordd(determiner,Word4),
        wordd(noun,Word5). 


% sentence(A,B,C,D,E). <-- query I used for ex. 2.3.

% ______________________________________________________

% Book Exercise: 2.4

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

% crossword(A,B,C,D,E,F). <-- query I used for ex. 2.4.

% ______________________________________________________________

% Canvas Exercise: 1

neighbor_left(clock, rocket).
neighbor_left(rocket, guitar).
neighbor_left(guitar, phone).

neighbor_top(paperclip, clock).
neighbor_top(scissors, guitar).

neighbor_right(rocket, clock).
neighbor_right(guitar, rocket).
neighbor_right(phone, guitar).

neighbor_bottom(clock, paperclip).
neighbor_bottom(guitar, scissors).


% Below 2 lines are my attempts at describing left_of() that can determine whether an object is to the left of another
% regardless of what row they are located in. However, this implementation results in an infinite loop after finding
% the initial answer. This loop prevents it from being useful to both "above()" and "below()".
        % left_of(X,Y):- neighbor_left(X,Y).
        % left_of(X,Y):- (neighbor_left(X,Z); neighbor_bottom(X,Z); neighbor_top(X,Z)), left_of(Z,Y).

left_of(X,Y):- neighbor_left(X,Y).
left_of(X,Y):- (neighbor_left(X,Z); neighbor_top(X,Z)), left_of(Z,Y).

% Below 2 lines are my attempts at describing right_of() that can determine whether an object is to the right of another
% regardless of what row they are located in. However, this implementation results in an infinite loop after finding
% the initial answer. This loop prevents it from being useful to both "above()" and "below()".
        % right_of(X,Y):- neighbor_right(X,Y).
        % right_of(X,Y):- (neighbor_right(X,Z); neighbor_bottom(X,Z); neighbor_top(X,Z)), right_of(Z,Y).

right_of(X,Y):- neighbor_right(X,Y).
right_of(X,Y):- (neighbor_right(X,Z); neighbor_top(X,Z)), right_of(Z,Y).

above(X,Y):- neighbor_top(X,Y).
above(X,Y):- neighbor_top(X,Z), (left_of(Z,Y); right_of(Z,Y)).

below(X,Y):- neighbor_bottom(X,Y).
below(X,Y):- neighbor_bottom(X,Z), (left_of(Z,Y); right_of(Z,Y)).


% ______________________________________________________________

% Canvas Exercise: 2

link(m, w, 1).
link(w, d, 1).
link(d, y, 1).
link(y, o, 1).
link(o, s, 1).
link(s, m, 1).

link(i, c, 2).

link(n, f, 3).
link(f, j, 3).

link(l, u, 4).
link(u, e, 4).
link(e, k, 4).
link(k, p, 4).

link(v, a, 5).
link(a, h, 5).
link(h, v, 5).

link(b, z, 6).
link(z, g, 6).
link(g, x, 6).
link(x, q, 6).
link(q, r, 6).
link(r, t, 6).
link(t, b, 6).

% :-['cluster_data'].

path(X,Y,C) :- link(X,Y,C).
path(X,Y,C) :- link(X,Z,C), path(Z,Y,C).

cyclic(Cluster) :-
        path(X,X,Cluster).
  % TODO: define cyclic/1 to
  % recognize cyclic clusters

% ______________________________________________________________
