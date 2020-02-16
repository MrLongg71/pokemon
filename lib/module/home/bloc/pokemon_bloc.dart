
import 'dart:async';

import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/remote/response/pokemon_repo.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc{
  final PokemonRepo _pokemonRepo = PokemonRepo();
  final StreamController <List<PokemonDetails>> _subject =
  BehaviorSubject<List<PokemonDetails>>();

  getPokemon() async {
    await _pokemonRepo.getPokemonList().then((pokemon){
      _subject.sink.add(pokemon);
    });
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<List<PokemonDetails>> get subject => _subject;
}