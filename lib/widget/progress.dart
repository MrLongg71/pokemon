import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({
    @required this.progress,
    this.color = Colors.red,
    this.backgroundColor = Colors.green,
  });

  final Color backgroundColor;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.green,
      ),
      child: FractionallySizedBox(
        widthFactor: progress,
        heightFactor: 1.0,
        child: Container(
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: color,
          ),
        ),
      ),
    );
  }
}
