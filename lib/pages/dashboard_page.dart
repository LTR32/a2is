import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        showIndicator: false,
      ),
    );
  }
}
