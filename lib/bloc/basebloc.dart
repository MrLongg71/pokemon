import 'dart:async';

import 'package:flutter/widgets.dart';


abstract class BaseBloc {
  StreamController<bool> _loadingStreamController = StreamController<bool>();

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  Sink<bool> get loadingSink => _loadingStreamController.sink;

  @mustCallSuper
  void dispose() {
    _loadingStreamController.close();
  }
}
