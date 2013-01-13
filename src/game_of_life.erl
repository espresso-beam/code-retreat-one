-module(game_of_life).

-export([life/1]).

life(AliveNeighbours) when AliveNeighbours < 2 -> dead;
life(AliveNeighbours) when AliveNeighbours =< 3 -> live;
life(_AliveNeighbours) -> nil.


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

should_always_pass_test() ->
    ?assert(true).

should_die_when_underpopulated_test() ->
    State1 = life(1),
    ?assertEqual(dead, State1),
    
    State0 = life(0),
    ?assertEqual(dead, State0).

%% Any live cell with two or three live neighbours lives on to the next generation.
should_live_with_2_or_3_neighbours_test() ->
    State2 = life(2),
    ?assertEqual(live, State2),
    
    State3 = life(3),
    ?assertEqual(live, State3).

%% Any live cell with more than three live neighbours dies,
%%  as if by overcrowding.

%% Any dead cell with exactly three live neighbours becomes a live cell,
%%  as if by reproduction.

-endif.
