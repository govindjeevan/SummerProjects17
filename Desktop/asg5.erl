-module(asg5).
-export([add/2,add/1,subtract/2,subtract/1,multiply/2,multiply/1,divide/1,divide/2,greaterThanX/1,lessThanX/1,derive/2,integral/4,integral/7,
foldl/3,map/2,map/1,foldl/1,foldr/1,filterl/1,filterl/2,filterl/3,foldr/3,filterr/1,filterr/2,filterr/3]).

% Implementing curried form of add
add(X,Y) -> F=add(X),
			F(Y).
add(X) -> fun(Y) -> X + Y end.

% Implementing curried form of subtract
subtract(X,Y) -> F=subtract(X),F(Y).
subtract(X) -> fun(Y) -> X - Y end.

% Implementing curried form of multiply
multiply(X,Y) -> F=multiply(X),F(Y).
multiply(X) -> fun(Y) -> X * Y end.

% Implementing curried form of divide
divide(X,Y) -> F=divide(X),F(Y).
divide(X) -> fun(Y) -> X/Y end.

% Using currying to find if one number is greater than another number
greaterThanX(X) -> fun(Y) -> Y > X end.

% Using currying to find if one number is less than the other
lessThanX(X) -> fun(Y) -> Y < X end.

% Finding the approximate derivative of F for a given H
derive(F,H) -> fun(X) -> (F(X + H) - F(X))/H end.

% Finding integral of F from A to B using Simpsons rule
integral(A,B,N,F) -> integral(A,B,N,F,0,(B-A)/N,0).
integral(A,B,N,F,Sum,H,I) -> 
	if I==0 ->
		integral(A,B,N,F,Sum+F(A),H,I+1);
	true -> 
		if I==N ->
			H*(Sum+F(B))/3;
		true->
			if (I rem 2)==1 ->
				integral(A,B,N,F,Sum+(4*F(A+(H*I))),H,I+1);
			true ->
				integral(A,B,N,F,Sum+(2*F(A+(H*I))),H,I+1)
			end
		end
	end.

% Implementing foldl using foldr
foldl(Func,X,List) ->  F=lists:foldr(fun(Xi,G) -> fun(A) -> G(Func(Xi,A)) end end,fun(X1) -> X1 end,List),
					   F(X).

% Implementing curried form of map
map(_,[]) -> [];
map(F,List) -> [F(hd(List))]++map(F,tl(List)).
map(F) -> fun(List) -> map(F,List) end.

% Fully curried form of foldl
foldl(Func) -> fun(List) -> fun(X) -> foldl(Func,X,List) end end.

foldr(_,X,[]) -> X;
foldr(F,X,List) -> Last=lists:last(List),
					foldr(F,F(Last,X),lists:droplast(List)).
% Fully curried form of foldr
foldr(Func) -> fun(List) -> fun(X) -> foldr(Func,X,List) end end.

filterr(F,List) -> filterr(F,List,[]).
filterr(F,List,X) -> foldr(fun(A,B)-> case F(A) of true -> B++[A]; false -> B end end,X,List).
% Fully curried filterr
filterr(F) -> fun(List) -> filterr(F,List) end.

filterl(F,List) -> filterl(F,List,[]).
filterl(F,List,X) -> foldl(fun(A,B)-> case F(A) of true -> B++[A]; false -> B end end,X,List).
% Fully curried filterl
filterl(F) -> fun(List) -> filterl(F,List) end.