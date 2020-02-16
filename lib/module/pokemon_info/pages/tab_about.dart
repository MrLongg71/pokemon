import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';

class PokemonAbout extends StatelessWidget {
  PokemonDetails pokemonDetails;

  PokemonAbout({@required this.pokemonDetails});

  Widget _buildSection(String text, {List<Widget> children, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style:
              TextStyle(fontSize: 16, height: 0.8, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 22),
        if (child != null)
          child,
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
      'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.',
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

        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                _buildLabel("Height"),
                SizedBox(height: 11),
                Text("$height", style: TextStyle(height: 0.8))
              ],
            ),
          ),
          Container(
            width: 1.0,
            color: Colors.grey,
            height: 50.0,
          ),
          Expanded(
            child: Column(
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
  Widget build(BuildContext context) {
//    final cardController = AnimationController(vsync: this);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            _buildDescription(pokemonDetails.name),
            SizedBox(height: 28),
            _buildHeightWeight(pokemonDetails.height, pokemonDetails.weight),
            SizedBox(height: 31),
            SizedBox(height: 35),
            _buildLocation(),
            SizedBox(height: 26),
            _buildTraining(pokemonDetails.baseExperience),
          ],
        ),
      ),
    );
  }
}
