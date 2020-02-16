import 'package:flutter/material.dart';
import 'package:flutter_pokemon/module/home/pages/home_page.dart';
import 'package:flutter_pokemon/module/move/pages/move_page.dart';
import 'package:flutter_pokemon/util/colors.dart';
import 'package:flutter_pokemon/widget/splash_screen.dart';
//
//class BottomNavigation extends StatefulWidget {
//  @override
//  _BottomNavigationState createState() => _BottomNavigationState();
//}
//
//class _BottomNavigationState extends State<BottomNavigation> {
//  int _selectedIndex = 0;
//  List<Widget> _widgetOptions = <Widget>[
//
//    HomePage(),
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      bottomNavigationBar: Container(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            _buildItemMenu(0,'pokemon_menu.png','Pokemon'),
//            _buildItemMenu(1,'move_menu.png','Moves'),
//            _buildItemMenu(2,'item_menu.png','Items'),
//          ],
//        ),
//      ),
//      body: _widgetOptions.elementAt(_selectedIndex),
//    );
//  }
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//  Widget _buildItemMenu(int index,String image,String nameMenu){
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: GestureDetector(
//          onTap: (){
//            _onItemTapped(index);
//          },
//          child: Column(
//            children: <Widget>[
//              Image.asset('assets/images/$image',
//              width: 30.0,
//              height: 30.0,
//              fit: BoxFit.cover,),
//              Text(nameMenu),
//            ],
//          ),
//      ),
//    );
//  }
//}
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MovesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Pokemon",style: TextStyle(color: ColorsAPP.gradientStart),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.motorcycle), title: Text("Moves",style: TextStyle(color: ColorsAPP.gradientStart),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.store), title: Text("Itens",style: TextStyle(color: ColorsAPP.gradientStart),)),

          ]),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
