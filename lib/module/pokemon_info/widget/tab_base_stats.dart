import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/models/pokemon.dart';
import 'package:flutter_pokemon/widget/progress.dart';


class Stat extends StatelessWidget {
  const Stat({
    Key key,
    @required this.animation,
    @required this.label,
    @required this.value,
    this.progress,
  }) : super(key: key);

  final Animation animation;
  final String label;
  final num value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final progress = this.progress == null ? this.value / 100 : this.progress;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text("$value"),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) => ProgressBar(
              progress: animation.value * progress,
              color: progress < 0.5 ? Colors.red : Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}

class PokemonBaseStats extends StatefulWidget {
  PokemonDetails pokemonDetails;
  PokemonBaseStats({this.pokemonDetails});
  @override
  _PokemonBaseStatsState createState() => _PokemonBaseStatsState();
}

class _PokemonBaseStatsState extends State<PokemonBaseStats> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

    _controller.forward();
  }

  List<Widget> generateStatWidget(PokemonDetails pokemon) {
    var total = pokemon.stats[0].baseStat +
        pokemon.stats[1].baseStat +
        pokemon.stats[2].baseStat +
        pokemon.stats[3].baseStat +
        pokemon.stats[4].baseStat +
        pokemon.stats[5].baseStat;
    return [
      Stat(
          animation: _animation, label: "Hp", value: pokemon.stats[5].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Atttack",
          value: pokemon.stats[4].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Defense",
          value: pokemon.stats[3].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Sp. Atk",
          value: pokemon.stats[2].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Sp. Def",
          value: pokemon.stats[1].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Speed",
          value: pokemon.stats[0].baseStat),
      SizedBox(height: 14),
      Stat(
          animation: _animation,
          label: "Total",
          value: total,
          progress: total / 600),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ...generateStatWidget(widget.pokemonDetails),
            SizedBox(height: 27),
            Text(
              "Type defenses",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 0.8,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "The effectiveness of each type on ${widget.pokemonDetails.name}.",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ],
        ),
      );
  }
}
