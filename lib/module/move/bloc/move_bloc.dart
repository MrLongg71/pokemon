import 'dart:async';

import 'package:flutter_pokemon/bloc/basebloc.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/move/models/move.dart';
import 'package:flutter_pokemon/remote/response/moves_repo.dart';
import 'package:rxdart/rxdart.dart';

class MoveBloc extends BaseBloc{
  final MovesRepo _movesRepo = MovesRepo();
  final StreamController <List<Move>> _subject =
  BehaviorSubject<List<Move>>();
  StreamController<bool> _loadingStreamController = StreamController<bool>();
  Stream<bool> get loadingStream => _loadingStreamController.stream;
  Sink<bool> get loadingSink => _loadingStreamController.sink;

  getMoveList() async {
    loadingSink.add(true);
    await _movesRepo.getMoveList().then((move){
      _subject.sink.add(move);
      loadingSink.add(false);

    });
  }

  dispose() {
    _subject.close();
    _loadingStreamController.close();
  }
  BehaviorSubject<List<Move>> get subject => _subject;
}