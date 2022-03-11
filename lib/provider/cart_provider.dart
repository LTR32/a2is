//@dart=2.9
import 'package:a2is/api_service.dart';
import 'package:a2is/models/cart_request_model.dart';
import 'package:flutter/material.dart';
import 'package:a2is/api_service.dart';

import '../models/cart_response_model.dart';



class CartProvider with ChangeNotifier {
  APIService _apiService;
  List<CartItem> _cartItems;

  List<CartItem> get CartItems => _cartItems;
  double get totalRecords => _cartItems.length.toDouble();

  CartProvider() {
    _apiService = new APIService();
    _cartItems = new List<CartItem>();
  }

  void resetStreams() {
    _apiService = new APIService();
    _cartItems = new List<CartItem>();
  }

  void addToCart(
      CartProducts product,
      Function onCallback,
      ) async{
    CartRequestModel requestModel = new CartRequestModel();
    requestModel.products = new List<CartProducts>();

    if(_cartItems == null) resetStreams();

    _cartItems.forEach((element) {
      requestModel.products.add(
        new CartProducts(productId: element.productId, quantity: element.qty)
      );
    });

    var isProductExist = requestModel.products.firstWhere(
            (prd) => prd.productId == product.productId,
    orElse: () => null,
    );

    if(isProductExist != null) {
      requestModel.products.remove(isProductExist);
    }

    requestModel.products.add(product);

    await _apiService.addCart(requestModel).then((cartResponseModel) {
      if(cartResponseModel.data != null) {
        _cartItems = [];
        _cartItems.addAll(cartResponseModel.data);
      }
      onCallback(cartResponseModel);
      notifyListeners();
    });
  }

  fetchCartItems() async {
    if(_cartItems == null) resetStreams();

    await _apiService.getCartItems().then((cartResponseModel){
      if(cartResponseModel.data != null) {
        _cartItems.addAll(cartResponseModel.data);
      }

      notifyListeners();
    });
  }
}