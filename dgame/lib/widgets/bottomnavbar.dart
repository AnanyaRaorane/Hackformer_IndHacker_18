import 'package:flutter/material.dart';

import '../pages/marketplace.dart';
class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Marketplace(),
    Text("game"),
    Text("profile"),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0F0F)  ,
      bottomNavigationBar:BottomNavigationBar(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded,color: Color(0xffFF2281),size: 30),
            label: "marketplace",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset,color: Color(0xffFF2281),size: 30,),
            label: "game",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp,color: Color(0xffFF2281),size: 30,),
            label: "profile",

          ),

        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),


    );
  }
}
