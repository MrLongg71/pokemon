import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/pokemon_info/pages/poke_info.dart';
import 'package:flutter_pokemon/module/pokemon_info/pokemon_info.dart';
import 'package:flutter_pokemon/util/gradient.dart';
import 'package:flutter_pokemon/util/styles.dart';

import '../bloc/pokemon_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonBloc pokemonBloc = PokemonBloc();
  Color colorItem = Colors.white;

  @override
  void initState() {
    super.initState();
    pokemonBloc.getPokemon();
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
                          "Pokemon",
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
          Container(
              margin: EdgeInsets.all(10.0),
              child: _pokemonList(pokemonBloc, colorItem)),
        ],
      ),
    ));
  }
}

Widget _pokemonList(PokemonBloc pokemonBloc, Color colors) {
  return StreamBuilder<List<PokemonDetails>>(
      initialData: [],
      stream: pokemonBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Có lỗi xảy ra');
        }
        return ListView.builder(
            padding: EdgeInsets.all(5.0),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return _buildItemList(snapshot.data[index], colors, context);
            });
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

Widget _buildItemList(
    PokemonDetails pokemonDetails, Color colors, BuildContext context) {
  return GestureDetector(
    onTap: () {
      onSelectedItem(colors, context, pokemonDetails);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: colors,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/pokemon_menu.png",
                          width: 20,
                          height: 20,
                          color: Colors.white.withOpacity(0.14),
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl:
                        'https://pokeres.bastionbot.org/images/pokemon/${pokemonDetails.id}.png',
                        imageBuilder: (context, image) => Image(
                          image: image,
                          width: 30,
                          height: 30,
                          alignment: Alignment.bottomCenter,
//                      color: selectedIndex == index ? null : Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        pokemonDetails.name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        '#00' + pokemonDetails.id.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/icon1.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        )
      ],
    ),
  );
}

void onSelectedItem(Color color, BuildContext context, PokemonDetails pokemonDetails) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonInfo(pokemonDetails: pokemonDetails,)));


//  showDialog(
//      barrierDismissible: true,
//      context: context,
//      builder: (context) => Dialog(
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(10.0),
//            ),
//            child: Padding(
//              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 12.0,bottom: 12.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      Image.network(
//                          'https://pokeres.bastionbot.org/images/pokemon/${pokemonDetails.id}.png',
//                          width: 50.0,
//                          height: 50.0,
//                          fit: BoxFit.cover),
//                      SizedBox(
//                        width: 10.0,
//                      ),
//                      Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Text(
//                            pokemonDetails.name,
//                            style: TextStyle(fontSize: 20.0),
//                          ),
//                          Text(
//                            '#00' + pokemonDetails.id.toString(),
//                            style: TextStyle(color: Colors.grey, fontSize: 15),
//                          ),
//                        ],
//                      )
//                    ],
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Image.asset(
//                        'assets/images/icon1.png',
//                        width: 40.0,
//                        height: 40.0,
//                        fit: BoxFit.cover,
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ));

//
//  showDialog(
//    context: context,
//    builder: (context) => Container(
//      color: Colors.white,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Image.network(
//                  'https://pokeres.bastionbot.org/images/pokemon/${pokemonUrl.id}.png',
//                  width: 50.0,
//                  height: 50.0,
//                  fit: BoxFit.cover),
//              SizedBox(
//                width: 10.0,
//              ),
//              Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Text(
//                    pokemonUrl.name,
//                    style: TextStyle(fontSize: 20.0),
//                  ),
//                  Text(
//                    '#00' + pokemonUrl.id.toString(),
//                    style: TextStyle(color: Colors.grey, fontSize: 15),
//                  ),
//                ],
//              )
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              Image.asset(
//                'assets/images/icon1.png',
//                width: 40.0,
//                height: 40.0,
//                fit: BoxFit.cover,
//              ),
//            ],
//          ),
//        ],
//      ),
//    ),
//  );
}
