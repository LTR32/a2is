import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Icon(Icons.help),
          new Icon(Icons.help),
          new Icon(Icons.help),
          new Icon(Icons.help),
        ],
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
    child: InkWell(onTap: (){},
    child: ListTile(
      title: Image.asset(image_location),
      subtitle: Text(image_caption),
    ),
    ),
    );
  }
}

