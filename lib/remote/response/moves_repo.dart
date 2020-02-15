import 'package:flutter_pokemon/module/move/models/move.dart';

import '../api_pokemon.dart';

class MovesRepo {
  Future<List<Move>> getMoveList() async {
    var response = await APIPokemon.getAPI().get('/v2/pokemon/1');
    var moves = response.data['moves'] as List;

    return moves.map((move) => Move.fromJson(move['move'])).toList();
  }
}
//[{move: {name: razor-wind, url: https://pokeapi.co/api/v2/move/13/}, version_group_details: [{level_learned_at: 0, move_learn_method: {name: egg, url: https://pokeapi.co/api/v2/move-learn-method/2/}, version_group: {name: crystal, url: https://pokeapi.co/api/v2/version-group/4/}}, {level_learned_at: 0, move_learn_method: {name: egg, url: https://pokeapi.co/api/v2/move-learn-method/2/}, version_group: {name: gold-silver, url: https://pokeapi.co/api/v2/version-group/3/}}]}, {move: {name: swords-dance, url: https://pokeapi.co/api/v2/move/14/}, version_group_details: [{level_learned_at: 0, move_learn_method: {name: machine, url: https://pokeapi.co/api/v2/move-learn-method/4/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {level_learned_at: 0, move_learn_method: {name: machine, url: https://pokeapi.co/api/v2/move-learn-method/4/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {level_learned_at: 0
