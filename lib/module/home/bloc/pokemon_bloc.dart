
import 'dart:async';

import 'package:flutter_pokemon/bloc/basebloc.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/remote/response/pokemon_repo.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc extends BaseBloc{
  final PokemonRepo _pokemonRepo = PokemonRepo();
  final StreamController <List<PokemonDetails>> _subject =
  BehaviorSubject<List<PokemonDetails>>();

  getPokemon() async {
    loadingSink.add(true);
    await _pokemonRepo.getPokemonList().then((pokemon){
      _subject.sink.add(pokemon);
      loadingSink.add(false);

    });
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<List<PokemonDetails>> get subject => _subject;
}