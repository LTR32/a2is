import 'package:a2is/config.dart';
import 'package:a2is/widgets/widget_home_categories.dart';
import 'package:a2is/widgets/widget_home_products.dart';
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
            imageCarousel(context),
            WidgetCategories(),
            WidgetHomeProducts(labelName: "Nos meilleurs offres !", tagId: Config.todayOffersTagId,),
            WidgetHomeProducts(labelName: "Nos meilleurs ventes !", tagId: Config.topSellingProductsTagId,)
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 170.0,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        showIndicator: false,
        images: [
          FittedBox(
            child: Image.asset('lib/images/diapo1-min.png'),
            fit: BoxFit.fill,
          ),
          FittedBox(
            child: Image.asset('lib/images/diapo2-min.png'),
            fit: BoxFit.fill,
          ),
          FittedBox(
            child: Image.asset('lib/images/diapo3-min.png'),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
