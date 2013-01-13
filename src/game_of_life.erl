-module(game_of_life).

-export([life/2]).

life(_State, AliveNeighbours) when AliveNeighbours < 2 -> dead;
life(alive,  AliveNeighbours) when AliveNeighbours =< 3 -> alive;
life(dead,   AliveNeighbours) when AliveNeighbours == 3 -> alive;
life(_State, _AliveNeighbours) -> nil.



-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

should_always_pass_test() ->
    ?assert(true).

should_die_when_underpopulated_test() ->
    State1a = life(alive, 1),
    ?assertEqual(dead, State1a),
    
    State0a = life(alive, 0),
    ?assertEqual(dead, State0a),

    State1d = life(dead, 1),
    ?assertEqual(dead, State1d),
    
    State0d = life(dead, 0),
    ?assertEqual(dead, State0d).
    

alive_cell_should_live_with_2_or_3_neighbours_test() ->
    State2 = life(alive, 2),
    ?assertEqual(alive, State2),
    
    State3 = life(alive, 3),
    ?assertEqual(alive, State3).


dead_cell_should_live_with_3_neighbours_test() ->
    State3 = life(dead, 3),
    ?assertEqual(alive, State3).



%% Any live cell with more than three live neighbours dies,
%%  as if by overcrowding.

%% Any dead cell with exactly three live neighbours becomes a live cell,
%%  as if by reproduction.

-endif.
