import 'package:flutter/material.dart';

import 'colors.dart';

// ignore: non_constant_identifier_names
Widget GradientAPP(){
  return Stack(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ColorsAPP.gradientStart, ColorsAPP.gradientEnd])),
      ),
      Container(
        color: ColorsAPP.gradient,
      )
    ],
  );
}
Widget GradientContainer(){
  return  Container(
    width: double.infinity,
    height: 4.0,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ColorsAPP.gradientEnd, ColorsAPP.gradientStart])),
  );
}