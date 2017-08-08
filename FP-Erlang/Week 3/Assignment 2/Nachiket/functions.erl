%
% Assignment Two
%
% Author-Nachiket
%
-module(functions).
-compile(export_all).
%
% 1) qsort that takes a list as a parameter and applies the quick sort 
%
qsort([]) -> [];
qsort([H|T]) ->
    {LeftList,RigthList}={[X||X <-T,X=<H] , [X||X <-T,X>H]},
    qsort(LeftList) ++ [H] ++ qsort(RigthList).
    
%
% Insertion Sort
insertsort(L)->insertsort(L,[]).
insertsort([],Acc)->Acc;
insertsort([H|T],Acc) ->
    insertsort(T,[X||X <-Acc,X=<H]++[H]++[X||X<-Acc,X>H]).
%
% Select Sort
selectsort(L)->selectsort(L,[]).
selectsort([],Acc) ->Acc;
selectsort(L,Acc) ->
	X = select(L),
	selectsort([P||P <- L, P/=X ],Acc++[X]).
%Selects the minimum element
select([H|T])->select(H,T).
select(X,[])-> X;
select(X,[H|T]) ->
case X < H of
	true -> select(X,T);
	false -> select(H,T)
end.
%
% Merge SOrt
msort([])->[];
msort([L])->[L];
msort(L)->
	X = length(L),
	{LeftList,RigthList} = lists:split(X div 2,L),
	merge(msort(LeftList),msort(RigthList)).
% merge function
merge([],R)->R;
merge(L,[])->L;
merge([H1|T1],[H2|T2])->
	case H1 > H2 of
		true->[H2] ++ merge([H1|T1], T2);
		false->[H1] ++ merge(T1, [H2|T2])
	end.
%
% Bubble Sort
bsort([]) -> [];
bsort(L)-> bsort(L, []).
bsort([X],Acc) -> [X|Acc];
bsort(L,Acc) ->
    [Max|Rest] = bmax_move(L, []),
    bsort(Rest,[Max|Acc]).
% MOves the largest element to Last
bmax_move([X], Rest) -> [X | Rest];
bmax_move([X,Y|T], Rest) ->
    case X > Y of
    	true-> bmax_move([X|T],[Y|Rest]);
        false-> bmax_move([Y|T],[X|Rest])
    end.
%
% 2) unique that takes a list as a parameter and returns the unique items 
%
unique(L)-> unique(L,[]).
unique([],Acc)-> Acc;
unique([H|T],Acc)->
    case lists:member(H, Acc) of
    true -> unique(T, Acc);
    false -> unique(T, Acc ++ [H])
  end.
%
% 3)function replicate that takes two parameters n and x and returns a list containing the value x n times
%
replicate(N,X) -> replicate(N,X,[]).
replicate(0,_,Acc)->Acc;
replicate(N,X,Acc) when N>0 -> replicate(N-1,X,Acc++[X]).
%
% 4) reverse that reverses the contents of an input list
%
rev(L) -> rev(L,[]).
rev([],Acc) -> Acc;
rev([H|T],Acc) -> rev(T,[H|Acc]).
%
% 5)zip that takes two lists as parameters and returns a list of tuples, 
%   where each tuple contains the i­th element from each of the input lists
%
zip(L1,L2)->zip(L1,L2,[]).
zip([],_,Acc)->Acc;
zip(_,[],Acc)->Acc;
zip([H1|T1],[H2|T2],Acc)-> zip(T1,T2,Acc++[{H1,H2}]).
%
% 6) Fibonacci Tail Recursive
%
fibo(1)->[0];
fibo(2)->[0,1];
fibo(N)-> fibo(N-2,0,1,[0,1]).
fibo(0,_,_,Acc)->Acc;
fibo(N,T2,T1,Acc)->
      fibo(N-1,T1,T1+T2,Acc++[T1+T2]).
%
%7) Fibo NON-Tail Recursive
fibonacci(1)-> 1;
fibonacci(2)-> 1;
fibonacci(N)-> fibonacci(N-1)+fibonacci(N-2).


%% Factorial
fact(N)->fact(N,1).
fact(0,Acc)->Acc;
fact(N,Acc)->fact(N-1,Acc*N).
   

%% Random List Generator
ranList(Size)->[rand:uniform(10000000)||_ <- lists:seq(1, Size)].
%% Timer function
timerFunc(Func, Size) -> 
	{Microsec, _}=timer:tc(functions, Func, [ranList(Size)]), 
    Microsec. 