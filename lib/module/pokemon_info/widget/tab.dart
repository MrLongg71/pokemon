import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/move/pages/move_page.dart';

import 'tab_about.dart';
import 'tab_base_stats.dart';

class TabData {
  TabData(this.label, this.child);

  final Widget child;
  final String label;
}

class PokemonTabInfo extends StatefulWidget {
  PokemonDetails pokemonDetails;
  PokemonTabInfo({this.pokemonDetails});
  @override
  _PokemonTabInfoState createState() => _PokemonTabInfoState();
}

class _PokemonTabInfoState extends State<PokemonTabInfo> with TickerProviderStateMixin {
  AnimationController scrollController;

  final List<TabData> _tabs = [
    TabData("About", PokemonAbout()),
    TabData("Base Stats", PokemonBaseStats()),
    TabData("Evolution", MovesPage()),
    TabData(
      "Moves",
      Container(
        alignment: Alignment.topCenter,
        child: Text("Under development"),
      ),
    ),
  ];

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
      ],
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
//        children: _tabs.map((tab) => tab.child).toList(),
      children: <Widget>[
        PokemonAbout(pokemonDetails: widget.pokemonDetails,),
        PokemonBaseStats(pokemonDetails: widget.pokemonDetails,),
        MovesPage(),
      ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedBuilder(
              animation: scrollController,
              builder: (context, _) => SizedBox(height: (1 - scrollController.value) * 16 + 6),
            ),
            _buildTabBar(),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }
}
