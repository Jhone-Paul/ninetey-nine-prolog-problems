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

  %Determine the prime factors of a given positive integer.
  % Construct a flat list containing the prime factors in ascending order.
  % Example:
  % ?- prime_factors(315, L).
  % L = [3,3,5,7]
  %
  %
prime_factors(X,L) :-
  X>1,
  prime_factors(X,2,[],L).

prime_factors(1,_,Acc,L):-
  reverse(Acc,L), !.

% If Div divides N, it's a factor — add it and divide N by it
prime_factors(N, Div, Acc, L) :-
    0 is N mod Div,
    N1 is N // Div,
    prime_factors(N1, Div, [Div|Acc], L).

% Otherwise, try the next possible divisor
prime_factors(N, Div, Acc, L) :-
    Div2 is Div + 1,
    prime_factors(N, Div2, Acc, L).

has_factor(N, F) :-
    N mod F =:= 0.
has_factor(N, F) :-
    F * F < N,
    F2 is F + 2,
    has_factor(N, F2).

% generate list of primes in range Low..High
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).
