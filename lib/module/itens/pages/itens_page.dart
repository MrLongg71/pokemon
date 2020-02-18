import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/itens/bloc/itens_bloc.dart';
import 'package:flutter_pokemon/util/gradient.dart';
import 'package:flutter_pokemon/util/styles.dart';
import 'package:flutter_pokemon/widget/loading_task.dart';

class ItensPage extends StatefulWidget {
  @override
  _ItensPageState createState() => _ItensPageState();
}

class _ItensPageState extends State<ItensPage> {
  ItensBloc itensBloc = ItensBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itensBloc.getItens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            child: Stack(
              children: <Widget>[
                GradientAPP(),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Itens",
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
          Expanded(
            child: Container(
                margin: EdgeInsets.all(10.0),
                child: _pokemonList(itensBloc, null)),
          ),
        ],
      ),
    );
  }

  Widget _pokemonList(ItensBloc itensBloc, Color colors) {
    return StreamBuilder<List<GameIndices>>(
        initialData: [],
        stream: itensBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Có lỗi xảy ra');
          }
          return LoadingTask(
            bloc: itensBloc,
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

  Widget _buildItemList(GameIndices gameIndices) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    gameIndices.gameIndex.toString() + '.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    gameIndices.version.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
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
}
