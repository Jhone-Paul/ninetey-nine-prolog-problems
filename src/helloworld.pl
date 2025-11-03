hello_world :- write('hello world!'),
              nl,
              write('Lets program!').
hello_world(X) :- 
  format("Hello ~w, Lets Program!", [X]).
