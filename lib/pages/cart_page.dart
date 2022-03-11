//@dart=2.9
import 'package:a2is/models/cart_response_model.dart';
import 'package:a2is/provider/cart_provider.dart';
import 'package:a2is/provider/loader_provider.dart';
import 'package:a2is/utils/ProgressHUD.dart';
import 'package:a2is/widgets/widget_cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        body: ProgressHUD(
          child: _cartItemsList(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
        ));
    });

    /*return CartProduct(
      data: new CartItem(
          productId: 8188,
          productName: "EPSON HOME XP-2100",
          qty: 2,
          thumbnail: "https://www.a2is.fr/wp-content/uploads/2022/02/Epson-XP-2100-80x80.png",
        productSalePrice: "150"
      ),
    );*/
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(
      builder: (context, cartModel, child) {
        if(cartModel.CartItems != null && cartModel.CartItems.length > 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: cartModel.CartItems.length,
                      itemBuilder: (context, index)
                  {
                    return CartProduct(data: cartModel.CartItems[index],);
                  }
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.sync,
                              color: Colors.white,
                            ),
                            Text(
                                'Mettre à jour le panier',
                            style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: (){},
                        padding: EdgeInsets.all(15),
                        color: Colors.green,
                        shape: StadiumBorder(),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        }
        else{
          return Container();
        }
      },
    );
  }
}
