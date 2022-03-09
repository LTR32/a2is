// @dart=2.9
import 'package:a2is/pages/base_page.dart';
import 'package:a2is/widgets/widget_product_details.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetails extends BasePage {
  ProductDetails({Key key, this.product}) : super(key: key);

  Product product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  @override
  Widget pageUI() {
    return ProductDetailsWidget(data: this.widget.product,);
  }
}
