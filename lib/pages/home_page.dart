// @dart=2.9

import 'package:flutter/material.dart';

import '../utils/cart_icons.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.home,
            ),
            label: 'Boutique'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.cart,
            ),
            label: 'Panier'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.favourites,
            ),
            label: 'Favoris'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.account,
            ),
            label: 'Mon Compte'
          ),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
        brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: false,
      title: Text(""
          "A2iS",
      style: TextStyle(color: Colors.white),
      ),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.shopping_cart, color: Colors.white,),
        SizedBox(width: 10,)
      ],
    );
  }
}
