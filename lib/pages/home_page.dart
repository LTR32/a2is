// @dart=2.9

import 'package:a2is/connectivity_provider.dart';
import 'package:a2is/no_internet.dart';
import 'package:a2is/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/cart_icons.dart';
import 'dashboard_page.dart';
import 'mentions.dart';
import 'notifications_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  List<Widget> _widgetList = [
    Dashboard(),
    CartPage(),
    Dashboard(),
    Dashboard()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
              DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Louis Doussineau', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 27),),
                ],
              )
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Accueil"),
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.shop),
                    title: Text("Boutique"),
                    children: <Widget>[Text("children 1"), Text("children 2")],
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text("Monc compte"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Paramètres"),
                  ),
                  Divider(),
                  ListTile(
                      leading: const Icon(Icons.notifications_none),
                      title: InkWell(
                        child: Text(
                            "Notifications"
                        ),
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationsPage()));},
                      )
                  ),
                  ListTile(
                      leading: const Icon(Icons.label_important),
                      title: InkWell(
                        child: Text(
                            'Mentions légales'
                        ),
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LegalMentionsPage()));},
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
      body: pageUI(),
    );
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        if (model.isOnline != null) {
          return model.isOnline
              ? _widgetList[_index]
              : NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
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
