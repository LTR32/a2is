// @dart=2.9

import 'package:a2is/api_service.dart';
import 'package:a2is/pages/base_page.dart';
import 'package:a2is/widgets/widget_product_card.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class SortBy {
  String value;
  String text;
  String sortOrder;

  SortBy(this.value, this.text, this.sortOrder);
}

class ProductPage extends BasePage {
  ProductPage({Key key, this.categoryId}) : super(key: key);

  int categoryId;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BasePageState<ProductPage> {
  APIService apiService;
  final _sortByOptions = [
    SortBy("popularity", "Popularité", "asc"),
    SortBy("modified", "Récent", "asc"),
    SortBy("price", "Prix: décroissant", "desc"),
    SortBy("price", "Prix croissant", "asc")
  ];

  @override
  void initState(){
    apiService = new APIService();

    super.initState();
  }

  @override
  Widget pageUI(){
    return _productsList();
  }

  Widget _productsList(){
    return new FutureBuilder(
        future: APIService().getProducts(),
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
    return Column(
      children: [
      _productFilters(),
      Flexible(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: items.map((Product item) {
              return ProductCard(
                data: item,
              );
            }).toList(),
          ),
      )
    ],
    );
  }

  Widget _productFilters() {
    return Container(
      height: 51,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Rechercher",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                fillColor: Color(0xffe6e6ec),
                filled: true,
    ),
                ),
              ),
                SizedBox(width: 15,),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffe6e6ec),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: PopupMenuButton(
              onSelected: (sortBy) {

              },
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                      value: item,
                      child: Container(
                        child: Text(item.text),
                      ),
                  );
                }).toList();
              },
              icon: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}
