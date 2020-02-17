import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/module/pokemon_info/widget/info.dart';
import 'package:flutter_pokemon/module/pokemon_info/widget/tab.dart';
import 'package:flutter_pokemon/widget/slide_up_panel.dart';

class PokemonInfo extends StatefulWidget {
  PokemonDetails pokemonDetails;

  PokemonInfo({this.pokemonDetails});

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo>
    with TickerProviderStateMixin {
  static const double _pokemonSlideOverflow = 20;

  AnimationController _cardController;
  AnimationController _cardHeightController;
  double _cardMaxHeight = 0.0;
  double _cardMinHeight = 0.0;
  GlobalKey _pokemonInfoKey = GlobalKey();

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _cardController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _cardHeightController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 220));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      final appBarHeight = 60 + 22 + IconTheme.of(context).size;

      final RenderBox pokemonInfoBox =
          _pokemonInfoKey.currentContext.findRenderObject();

      _cardMinHeight =
          screenHeight - pokemonInfoBox.size.height + _pokemonSlideOverflow;
      _cardMaxHeight = screenHeight - appBarHeight;

      _cardHeightController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _cardHeightController,
            child: PokemonTabInfo(
              pokemonDetails: widget.pokemonDetails,
            ),
            builder: (context, child) {
              return SlidingUpPanel(
                controller: _cardController,
                minHeight: _cardMinHeight * _cardHeightController.value,
                maxHeight: _cardMaxHeight,
                child: child,
              );
            },
          ),
          IntrinsicHeight(
            child: Container(
              key: _pokemonInfoKey,
              child: PokemonOverallInfo(
                pokemonDetails: widget.pokemonDetails,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
