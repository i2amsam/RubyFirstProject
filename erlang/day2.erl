%%%--------- Seven Languages in Seven Weeks ------------
%%%--------------------Erlang Day 2 --------------------

-module(day2).
-export([findValue/2]).
-export([totalList/1]).

%% Write a function that accepts the list and a keyword and returns the associated value
%% for the keyword

%% Problem 1:
%% Return V from the sets of K,V in List where K is equal to the passed in K
findValue(Key,List)->[V || {K,V} <- List, Key==K]. 

%%   --- Example ---
%%-  day2:findValue(ruby,[{erlang,"a function"},{ruby,"an object"}]).  
%%   ["an object"]


%% Problem 2:
%% Consider a shopping list that looks like [{item, quantity,price},...].
%% Write a list comprehension that builds the list of items of the form
%% [{item, total_price},...]
totalList(List)->[{I,Q*P} || {I,Q,P} <- List].

%% Too easy!!!
%% day2:totalList([{pencils,10,0.50},{pens,50,1.25}]).  
%% [{pencils,5.0},{pens,62.5}]
