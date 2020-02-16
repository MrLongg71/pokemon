import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';


class PokemonAbout extends StatefulWidget {
  PokemonDetails pokemonDetails;
  PokemonAbout({this.pokemonDetails});
  @override
  _PokemonAboutState createState() => _PokemonAboutState();
}

class _PokemonAboutState extends State<PokemonAbout> with TickerProviderStateMixin{
  AnimationController cardController;

  Widget _buildSection(String text, {List<Widget> children, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 16, height: 0.8, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 22),
        if (child != null) child,
        if (children != null) ...children
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        height: 0.8,
      ),
    );
  }

  Widget _buildDescription(String about) {
    return Text(
      about,
      style: TextStyle(height: 1.3),
    );
  }

  Widget _buildHeightWeight(int height, int weight) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel("Height"),
                SizedBox(height: 11),
                Text("$height", style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLabel("Weight"),
                SizedBox(height: 11),
                Text("$weight", style: TextStyle(height: 0.8))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return _buildSection(
      "Location",
      child: AspectRatio(
        aspectRatio: 2.253,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildTraining(int baseExp) {
    return _buildSection(
      "Training",
      child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: _buildLabel("Base EXP")),
          Expanded(flex: 3, child: Text(baseExp.toString())),
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  cardController = AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cardController,
      child:  Column(
          children: <Widget>[
            _buildDescription(widget.pokemonDetails.locationAreaEncounters),
            SizedBox(height: 28),
            _buildHeightWeight(widget.pokemonDetails.height, widget.pokemonDetails.weight),
            SizedBox(height: 31),
            SizedBox(height: 35),
            _buildLocation(),
            SizedBox(height: 26),
            _buildTraining(widget.pokemonDetails.baseExperience),
          ],
        ),
      builder: (context, child) {
        final scrollable = cardController.value.floor() == 1;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          child: child,
        );
      },
    );
  }
}
