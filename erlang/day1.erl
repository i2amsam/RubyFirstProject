%%  
% Seven Languages in Seven Weeks
% Erlang - Week 5
% Sam Phillips
%%

%Example from the end of the chapter
-module(day1).
-export([another_factorial/1]).
-export([another_fib/1]).
-export([fib/1]).
-export([cwords/1]).
-export([countTo10/0]).
-export([printer/1]).

another_factorial(0) -> 1;
another_factorial(N) -> N * another_factorial(N-1).

%Fib from the book, slow...
another_fib(0) -> 1;
another_fib(1) -> 1;
another_fib(N) -> another_fib(N-1) + another_fib(N-2).

%Faster Fib
fib(N) -> fib(N, 0, 1).
fib(0, _, B) -> B;
fib(N, A, B) ->  fib(N-1, B, A+B).

%% ------ Problem #1 --------
%% Use recursion to write a function which returns the number of words in a string
%% There is one more word that spaces (simple version)
cwords([])->0;
cwords(X)->cspaces(X)+1.

%%Count the number of spaces, 32 is the ascii code for " " 
cspaces([]) -> 0;
cspaces([32|Tail])->1+cspaces(Tail);
cspaces([_|Tail])->cspaces(Tail).

%% ----Output example-----
%% 31> day1:cwords("Three Dang Words"). 
%% 3

%% -------- Problem #2  --------
%% Write a function which uses recursion to count to 10
countTo10()->countUp(0).
countUp(10)->io:format("~p~n",[10]);
countUp(X)->io:format("~p~n",[X]),countUp(X+1).


%% -------- Problem #3 ---------
%% Write a fucntion that uses matching to selectivly print "success" or
%% "error: message" given input of the form {error, Message} or success
printer(success)->io:format("success!~n");
printer({error,Message})->io:format("error: ~p~n",[Message]).

