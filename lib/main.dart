import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/pages/home_page.dart';
import 'package:flutter_pokemon/module/pokemon_info/pages/poke_info.dart';
import 'package:flutter_pokemon/widget/bottom_navigation.dart';
import 'package:flutter_pokemon/widget/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/home': (context) => BottomNavigation(),
      },
    );
  }
}
