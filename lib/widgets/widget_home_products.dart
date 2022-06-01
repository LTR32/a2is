// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:a2is/models/product.dart';

import '../api_service.dart';
import '../utils/colors.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({Key key, this.labelName, this.tagId}) : super(key: key);

  String labelName;
  String tagId;

  @override
  _WidgetHomeProductsState createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF4F7FA),
    child: Column(
    children: <Widget>[
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, top: 4),
    child: Text(
    this.widget.labelName,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(left: 16, top: 4),
    child: FlatButton(
    onPressed: () {},
    child: Text(
    'Voir tout',
    style: TextStyle(color: AppColors.mainColor),
    ),
    ),
    )
    ],
      ),
      _productsList(),
    ],
    ),
    );
  }

  Widget _productsList() {
    return new FutureBuilder(
        future: apiService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
          if(model.hasData) {
            return _buildList(model.data);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }

  Widget _buildList(List<Product> items) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            var data = items[index];
            var price = double.parse(data.salePrice);
            price = price * 1.2;
            var regularPrice = double.parse(data.regularPrice);
            regularPrice = regularPrice * 1.2;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 130,
                    height: 120,
                  alignment: Alignment.center,
                  child: Image.network(
                    data.images[0].src,
                    height: 120,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0,5),
                        blurRadius: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 130,
                    alignment: Alignment.centerLeft,
                  child: Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4, left: 4),
                  width: 130,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        '${regularPrice.toStringAsFixed(2)} €',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${price.toStringAsFixed(2)} €',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
      ),
    );
  }
}
