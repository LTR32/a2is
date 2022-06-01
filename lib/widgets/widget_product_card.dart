// @dart=2.9

import 'package:a2is/pages/product_details.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/colors.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key key, this.data}) : super(key: key);

  Product data;

  @override
  Widget build(BuildContext context) {
    var price = double.parse(data.salePrice);
    price = price * 1.2;
    var regularPrice = double.parse(data.regularPrice);
    regularPrice = regularPrice * 1.2;

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: data,
                  ),
              ),
          );
        },
     child: Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Visibility(
                    visible: data.calculateDiscount() > 0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      '- ${data.calculateDiscount()}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                ),
                Flexible(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffE65829).withAlpha(40),
                        ),
                        Image.network(
                          data.images.length > 0
                              ? data.images[0].src
                              : "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
                          height: 160,
                        ),
                      ],
                    ),
                ),
                SizedBox(height: 5,),
                Text(
                  data.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: data.salePrice != data.regularPrice,
                        child: Text(
                          '${regularPrice.toStringAsFixed(2)} €',
                          style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    Text(
                      '${price.toStringAsFixed(2)} €',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
     )
    );
  }
}
