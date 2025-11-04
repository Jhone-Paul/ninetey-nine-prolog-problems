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

% coprime if gcd is 1
coprime(X,Y):- 
  gcd(X,Y,G),
  G == 1.

% totient_coprime(X, Y, G): G = 1 if coprime, 0 otherwise
totient_coprime(X, Y, 1) :-
    coprime(X, Y), !.
totient_coprime(_, _, 0).

% totient_phi(X, R): R = count of numbers < X that are coprime to X
totient_phi(1, 1) :- !.
totient_phi(X, R) :-
    X > 1,
    totient_helper(X, 1, 0, R).

% helper predicate that loops from 1..X
totient_helper(X, X, Acc, Acc) :- !.
totient_helper(X, I, Acc, R) :-
    I < X,
    totient_coprime(X, I, G),
    Acc1 is Acc + G,
    I1 is I + 1,
    totient_helper(X, I1, Acc1, R). 
