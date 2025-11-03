% I HATE RECURSION WHY DOES PROLOG ONLY HAVE RECURSION 
% why is it so hard to debug
% all of this could have been done iteratively
% who cooked up this list nonsense :'(


% find the last entry in a list
%base case
p01(X,[X]).
p01(X, [_|L]) :-
  p01(X, L).

% find the last but one element of a list
p02(X,[X,_]).
p02(X,[_|L]) :-
  p02(X,L).

% find the Kth element in a list
p03(X,[X|_],1).
p03(X,[_|L],N) :-
  N1 is N-1,
  p03(X,L,N1).

%find the length of a list
p04(0,[]).
p04(X,[_|L]) :-
  p04(X1,L),
  X is X1+1.

% p05(+List, -Reversed)
p05([], []).  % Base case: reversing an empty list gives an empty list.
p05([H|T], X) :-
    p05(T, X1),
    append(X1, [H], X).

% find out if its a palindrome or something
p06(L) :- 
  p05(L, L2), % reverse the list
  L = L2.

% recursivley flatted a nested list

p07([], []).
p07([H|T], Flat) :-
    p07(H, FH),
    p07(T, FT),
    append(FH, FT, Flat).
p07(X, [X]) :-
    \+ is_list(X).

% remove duplicates from a list or something
p08([], X, X).
p08([H|T], X, Result) :-
    member(H, X),
    p08(T, X, Result).
p08([H|T], X, Result) :- 
    \+ member(H, X),
    append(X, [H], X1),
    p08(T, X1, Result).

