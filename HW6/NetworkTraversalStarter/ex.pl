% DCG to describe the language
% a^nb^n
% (N a's followed by N b's)

% ?- s([a,a,a,b,b,b], []).
% true .

% ?- s([a,a,b,b], []).
% true .

% ?- s([a,b,a,b,a], []).
% false.

% ?- s([a,a,a,a,b,b,b], []).
% false.

% ?- phrase(s, S).
% S = [] ;
% S = [a, b] ;
% S = [a, a, b, b] ;
% S = [a, a, a, b, b, b] ;
% S = [a, a, a, a, b, b, b, b] ;


sentence --> [].
sentence -->
    a,
    sentence,
    b.


a --> [a].
b --> [b].
