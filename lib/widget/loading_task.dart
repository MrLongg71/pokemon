import 'package:flutter/material.dart';
import 'package:flutter_pokemon/bloc/basebloc.dart';
// ignore: must_be_immutable
class LoadingTask extends StatelessWidget {
  BaseBloc bloc;
  Widget child;
  LoadingTask({this.bloc,this.child});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.loadingStream,
      initialData: false,
      builder: (context,snapshot) => Stack(
        children: <Widget>[
          snapshot.data == true ? CircularProgressIndicator(backgroundColor: Colors.red,) : child
        ],
      ),
    );
  }
}
