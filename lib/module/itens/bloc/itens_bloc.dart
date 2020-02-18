import 'dart:async';

import 'package:flutter_pokemon/bloc/basebloc.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/remote/response/itens_repo.dart';
import 'package:rxdart/rxdart.dart';

class ItensBloc extends BaseBloc{

  final ItensRepo _itensRepo = ItensRepo();
  final StreamController <List<GameIndices>> _subject =
  BehaviorSubject<List<GameIndices>>();

  getItens() async {
    loadingSink.add(true);
    await _itensRepo.getItensList().then((itens){
      _subject.sink.add(itens);
      loadingSink.add(false);

    });
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<List<GameIndices>> get subject => _subject;

}