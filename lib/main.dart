import 'package:a2is/pages/base_page.dart';
import 'package:a2is/pages/cart_page.dart';
import 'package:a2is/pages/home_page.dart';
import 'package:a2is/pages/login_page.dart';
import 'package:a2is/pages/product_details.dart';
import 'package:a2is/pages/product_page.dart';
import 'package:a2is/provider/cart_provider.dart';
import 'package:a2is/provider/loader_provider.dart';
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
          ),
          ChangeNotifierProvider(
            create: (context) => LoaderProvider(),
            child: BasePage(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
            child: ProductDetails(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
            child: CartPage(),
          ),
        ],
        child: MaterialApp(
          title: "A2iS",
          debugShowCheckedModeBanner: false,
          home: HomePage(),
    ),
    );
  }
}

