import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'lib/images/informatique.png',
            image_caption: 'Informatique',
          ),
          Category(
            image_location: 'lib/images/informatique.png',
            image_caption: 'Informatique',
          ),
          Category(
            image_location: 'lib/images/informatique.png',
            image_caption: 'Informatique',
          ),
        ],
      ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    required this.image_caption,
    required this.image_location
});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
    child: InkWell(
      onTap: (){},
      child: Container(
    width: 120.0,
      child: ListTile(
    title: Image.asset(
    image_location,
    width: 100.0,
    height: 80.0,
    ),
    subtitle: Container(
      alignment: Alignment.topCenter,
      child: Text(image_caption, style: new TextStyle(fontSize: 12.0),),
    )
    ),
    ),
    ),
    );
  }
}

