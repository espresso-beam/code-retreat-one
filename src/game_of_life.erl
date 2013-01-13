-module(game_of_life).

-export([life/1]).

life(AliveNeighbours) when AliveNeighbours < 2 -> dead;
life(AliveNeighbours) -> nil.


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

should_always_pass_test() ->
    ?assert(true).

%% Any live cell with fewer than two live neighbours dies,
%%  as if caused by under-population.
should_die_when_underpopulated_test() ->
    State1 = life(1),
    ?assertEqual(dead, State1),
    
    State0 = life(0),
    ?assertEqual(dead, State0).


%% Any live cell with two or three live neighbours lives on to the next generation.

%% Any live cell with more than three live neighbours dies,
%%  as if by overcrowding.

%% Any dead cell with exactly three live neighbours becomes a live cell,
%%  as if by reproduction.

-endif.
