% This is the file containing some of the questions that are arithmatic related :) 
divisible(X, Y) :-
    0 is X mod Y, !.
divisible(X, Y) :-
    Y1 is Y + 1,
    Y1 < X,
    divisible(X, Y1).

is_prime(2) :- !.
is_prime(X) :-
    X < 2, !, false.
is_prime(X) :-
    \+ divisible(X, 2).

% euclids algo or something 
gcd(X,Y,Y) :-
  0 is X mod Y, !. 

gcd(X,Y,G) :- 
  R is X mod Y, 
  gcd(Y,R,G).

