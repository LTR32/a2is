import 'package:a2is/pages/home_page.dart';
import 'package:a2is/pages/login_page.dart';
import 'package:a2is/pages/product_page.dart';
import 'package:a2is/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ProductProvider(),
          child: ProductPage(),
          )
        ],
        child: MaterialApp(
          title: 'Woocommerce App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            floatingActionButtonTheme: FloatingActionButtonThemeData (
              elevation: 0,
              foregroundColor: Colors.white,
            ),
            accentColor: Colors.redAccent,
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
              headline2: TextStyle(
                fontSize: 24.0,
                color: Colors.redAccent,
              ),
            ),
          ),
          home: HomePage(),
        ),
    );
  }
}
/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 */

