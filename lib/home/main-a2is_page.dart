import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../utils/colors.dart';
import '../widgets/big_text.dart';
import 'a2is_page_body.dart';
import 'package:a2is/components/horizontal_list.dart';

class MainA2iSPage extends StatefulWidget {
  const MainA2iSPage({Key? key}) : super(key: key);

  @override
  _MainA2iSPageState createState() => _MainA2iSPageState();
}

class _MainA2iSPageState extends State<MainA2iSPage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('lib/images/diapo.jpg'),
          AssetImage('lib/images/diapo.jpg'),
          AssetImage('lib/images/diapo.jpg'),
          AssetImage('lib/images/diapo.jpg'),
          AssetImage('lib/images/diapo.jpg'),
        ],
        autoplay: true,
       // animationCurve: Curves.fastOutSlowIn,
       // animationDuration: Duration(milliseconds: 1000),
       // dotSize: 4.0,
       // indicatorBgPadding: 2.0,
        showIndicator: false,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.mainColor,
        title: !isSearching
          ? Text("A2iS", style: TextStyle(fontSize: 24.0))
          : TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            icon: Icon
              (Icons.search,
            color: Colors.white,
            ),
            hintText: "Rechercher...",
            hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        actions: <Widget>[
          isSearching ?
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.white,),
            onPressed: () {
              setState(() {
                this.isSearching = false;
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children:<Widget> [
            new UserAccountsDrawerHeader(
                accountName: Text('Louis Doussineau'),
                accountEmail: Text('doussineaulouis@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
              color: AppColors.mainColor
            ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Accueil'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mon compte'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes commandes'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favoris'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Paramètres'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Aide'),
                leading: Icon(Icons.help, color: Colors.green,),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          //carousel
          image_carousel,

          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),),

          //Horizontal list View
          HorizontalList(),
        ],
      ),
    );
  }
}
