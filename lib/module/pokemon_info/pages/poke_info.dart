import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/pokemon_info/pages/tab_about.dart';
import 'package:flutter_pokemon/module/pokemon_info/pages/tab_base_stats.dart';
import 'package:flutter_pokemon/util/gradient.dart';

class PokeInfo extends StatefulWidget {
  PokemonDetails pokemonDetails;

  PokeInfo({this.pokemonDetails});

  @override
  _PokeInfoState createState() => _PokeInfoState();
}

class _PokeInfoState extends State<PokeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientAPP(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: (MediaQuery.of(context).size.width / 2) - 100,
            right: (MediaQuery.of(context).size.width / 2) - 200,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Image.asset(
                    "assets/images/pokemon_menu.png",
                    width: 20,
                    height: 20,
                    color: Colors.white.withOpacity(0.14),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                  'https://pokeres.bastionbot.org/images/pokemon/${widget.pokemonDetails.id}.png',
                  imageBuilder: (context, image) => Image(
                    image: image,
                    width: 200,
                    height: 150,
//                      color: selectedIndex == index ? null : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: _buildInfoPokemon(widget.pokemonDetails, context),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildInfoPokemon(PokemonDetails pokemonDetails, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
    ),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text(pokemonDetails.name,style: TextStyle(fontSize: 30.0),),
          SizedBox(height: 10.0,),
          _buildBorderBlue('WATER'),
          _buildDefautTabs(context, pokemonDetails)
        ],
      ),
    ),
  );
}

Widget _buildBorderBlue(String text) {
  return Container(
    width: 100.0,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(40.0)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _buildDefautTabs(BuildContext context, PokemonDetails pokemonDetails) {
  return DefaultTabController(
    length: 3,
    initialIndex: 0,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//            AnimatedBuilder(
//              animation: scrollController,
//              builder: (context, _) => SizedBox(height: (1 - scrollController.value) * 16 + 6),
//            ),
          _buildTabBar(),
          _buildTabContent(pokemonDetails),
        ],
      ),
    ),
  );
}

Widget _buildTabContent(PokemonDetails pokemonDetails) {
  return Expanded(
    child: TabBarView(
//        children: tabs.map((tab) => tab.child).toList(),
      children: <Widget>[
        PokemonAbout(
          pokemonDetails: pokemonDetails,
        ),
        PokemonBaseStats(pokemonDetails: pokemonDetails,),
//        PokemonEvolution(),
      ],
    ),
  );
}

Widget _buildTabBar() {
  return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2,
      indicatorColor: Colors.indigo,
      tabs: [
        Text("About"),
        Text("Base Stats"),
        Text("Evolution"),
      ]);
}
