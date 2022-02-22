import 'package:a2is/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';

class listProducts extends StatefulWidget {
  const listProducts({Key? key}) : super(key: key);

  @override
  _listProductsState createState() => _listProductsState();
}

class _listProductsState extends State<listProducts> {
  List<WooProduct> products = [];
  bool isSearching = false;

  WooCommerce wooCommerce = WooCommerce(
      baseUrl: Config.baseUrl,
      consumerKey: Config.key,
      consumerSecret: Config.secret,
      isDebug: true);

  getProducts() async {
    products = await wooCommerce.getProducts(perPage: 26);
    setState(() {});
    print(products.toString());
  }

  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('Liste des produits', style: TextStyle(fontSize: 24.0))
            : TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon
                (Icons.search,
                color: Colors.white,
              ),
              hintText: "Rechercher...",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          isSearching ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                this.isSearching = false;
              });
            },
              )
              : IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  this.isSearching = true;
                });
              },
          )
        ],
      ),
      body: GridView.builder(
          itemCount: products.length,
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) {
            final product = products[index];
            return Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(product.images[0].src),
                    fit: BoxFit.cover,
                  ),
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                Text(product.name ?? 'Chargement..',
                ),
                Text(product.price + '\ €',
                style: TextStyle(fontSize: 24.0, color: Colors.pinkAccent),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  color: Colors.black,
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                )
              ],
            );
          }),
    );
  }
}
