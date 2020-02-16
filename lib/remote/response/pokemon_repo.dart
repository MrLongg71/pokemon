
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/remote/api_pokemon.dart';

class PokemonRepo {
  Future<List<PokemonDetails>> getPokemonList() async {
    var response = await APIPokemon.getAPI().get('/v2/pokemon?limit=20');
    var urlList = response.data['results'] as List;
    List<Pokemon> urls =  urlList.map((url) => Pokemon.fromJson(url)).toList();
    List<PokemonDetails> pokemonList = [];
    for(Pokemon pokemon in urls){
      var response = await APIPokemon.APIUrl().get(pokemon.url);
      pokemonList.add(PokemonDetails.fromJson(response.data));
    }
    return pokemonList;
  }
}