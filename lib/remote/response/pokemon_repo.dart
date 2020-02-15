
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/remote/api_pokemon.dart';

class PokemonRepo {
  Future<List<PokemonUrl>> getPokemonList() async {
    print("vo3");
    var response = await APIPokemon.getAPI().get('/v2/pokemon?limit=20');
    print(response.data);
    var urlList = response.data['results'] as List;
    List<Pokemon> urls =  urlList.map((url) => Pokemon.fromJson(url)).toList();
    List<PokemonUrl> pokemonList = [];
    for(Pokemon pokemon in urls){
      var response = await APIPokemon.APIUrl().get(pokemon.url);
      print(response.data);
      pokemonList.add(PokemonUrl.fromJson(response.data));
    }
    return pokemonList;
  }
}