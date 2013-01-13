-module(game_of_life).

-export([life/2]).


life(_State, 3) -> alive;
life(alive, 2) -> alive;
life(_State, _AliveNeighbours) -> dead.


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

alive_cell_should_die_when_overpopulated_test() ->
    State4 = life(alive, 4),
    ?assertEqual(dead, State4),
    
    State5 = life(alive, 5),
    ?assertEqual(dead, State5).

-endif.
