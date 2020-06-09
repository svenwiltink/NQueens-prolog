position(X, Y):-
    between(1, 8, X),
    between(1, 8, Y).

share_diag(queen(X, Y), queen(Ox, Oy)):-
    XD is abs(X-Ox),
    YD is abs(Y-Oy),
    XD = YD.

share_coord(_, []):- fail.
share_coord(queen(X, Y), [queen(Ox, Oy)|Rq]):-
    X = Ox ;
    Y = Oy ;
    share_diag(queen(X, Y), queen(Ox, Oy)) ;
    share_coord(queen(X,Y), Rq).

n_queens(1, [queen(X,Y)], Placed):-
    position(X, Y),
    \+ share_coord(queen(X, Y), Placed).

n_queens(N, [queen(X,Y)|Rq], Placed):-
    N > 1,
    Nr is N - 1,
    position(X, Y),
    \+ share_coord(queen(X, Y), Placed),
    n_queens(Nr, Rq, [queen(X,Y)|Placed]).

:-
    n_queens(8, Queens, []),
    format("~p", [Queens]),
    halt.