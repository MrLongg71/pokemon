import 'package:flutter_pokemon/module/home/models/pokemon.dart';

import '../api_pokemon.dart';

class ItensRepo {
  Future<List<GameIndices>> getItensList() async {
    var response = await APIPokemon.getAPI().get('/v2/pokemon/1');
    var games = response.data['game_indices'] as List;
    return games.map((game) => GameIndices.fromJson(game)).toList();
  }
}
