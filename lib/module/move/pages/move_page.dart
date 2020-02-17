import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/move/bloc/move_bloc.dart';
import 'package:flutter_pokemon/module/move/models/move.dart';
import 'package:flutter_pokemon/util/gradient.dart';
import 'package:flutter_pokemon/util/styles.dart';
import 'package:flutter_pokemon/widget/loading_task.dart';

class MovesPage extends StatefulWidget {
  @override
  _MovesPageState createState() => _MovesPageState();
}

class _MovesPageState extends State<MovesPage> {
  MoveBloc moveBloc = MoveBloc();

  @override
  void initState() {
    super.initState();
    moveBloc.getMoveList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            child: Stack(
              children: <Widget>[
                GradientAPP(),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Move",
                          style: Styles.pokemon,
                        ),
                      ),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GradientContainer(),
          Container(margin: EdgeInsets.all(10.0), child: _moveList(moveBloc)),
        ],
      ),
    ));
  }
}

Widget _moveList(MoveBloc moveBloc) {
  return StreamBuilder<List<Move>>(
      initialData: [],
      stream: moveBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Có lỗi xảy ra');
        }
        return LoadingTask(
          bloc: moveBloc,
          child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildItemList(snapshot.data[index]);
              }),
        );
      });
}

Widget _buildItemList(Move move) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              move.name,
              style: TextStyle(fontSize: 18),
            ),
            Image.asset(
              'assets/images/icon1.png',
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        )
      ],
    ),
  );
}

Widget _buildSearchBar() {
  return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextField(
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: 'Search',
        ),
      ));
}
