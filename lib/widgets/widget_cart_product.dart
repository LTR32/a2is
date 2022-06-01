//@dart=2.9
import 'package:a2is/utils/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:a2is/models/cart_response_model.dart';

import '../utils/colors.dart';

class CartProduct extends StatelessWidget {
  CartProduct({this.data});

  CartItem data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTitle(context),
      ),
    );
  }

  ListTile makeListTitle(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        leading: Container(
          width: 50,
          height: 150,
          alignment: Alignment.center,
          child: Image.network(
            data.thumbnail,
            height: 150,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            data.productName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.all(5),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                "${data.productSalePrice.toString()} €",
                style: TextStyle(color: Colors.black),
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Supprimer",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                onPressed: () {},
                padding: EdgeInsets.all(8),
                color: AppColors.mainColor,
                shape: StadiumBorder(),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: 120,
          child: CustomStepper(
            lowerLimit: 0,
            upperLimit: 20,
            stepValue: 1,
            iconSize: 22.0,
            value: data.qty,
            onChanged: (value) {},
          ),
        ),
      );
}
