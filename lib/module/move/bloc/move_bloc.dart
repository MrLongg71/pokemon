import 'dart:async';

import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/move/models/move.dart';
import 'package:flutter_pokemon/remote/response/moves_repo.dart';
import 'package:rxdart/rxdart.dart';

class MoveBloc{
  final MovesRepo _movesRepo = MovesRepo();
  final StreamController <List<Move>> _subject =
  BehaviorSubject<List<Move>>();

  getMoveList() async {
    await _movesRepo.getMoveList().then((move){
      _subject.sink.add(move);
    });
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<List<Move>> get subject => _subject;
}