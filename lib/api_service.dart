// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:a2is/config.dart';
import 'package:a2is/models/customer.dart';
import 'package:a2is/models/login_model.dart';
import 'package:dio/dio.dart';

import 'models/category.dart';
import 'models/product.dart';

class APIService{
  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret),
    );

    bool ret = false;

    try {
      var response = await Dio().post(
        Config.url + Config.customerURL,
        data: model.toJson(),
        options: new Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json'
          }));
      if(response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if(e.response?.statusCode == 404) {
        ret = false;
      }
      else {
        ret = false;
      }
    }
    return ret;
  }

  Future<LoginResponseModel> loginCustomer(String username, String password) async {
    LoginResponseModel model;

    try{
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          "username": username,
          "password": password,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      }
      )
      );
      if(response.statusCode == 200) {
        model = LoginResponseModel.fromJson(response.data);
      }
    } on DioError catch(e) {
      print(e.message);
    }
    return model;
  }

  Future <List<Category>> getCategories() async {
    List<Category> data = new List<Category>();

    try {
      String url = Config.categoriesURL;
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if(response.statusCode == 200) {
        data = (response.data as List)
            .map(
                (i) => Category.fromJson(i),
        )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

 Future <List<Product>> getProducts({
   int pageNumber,
   int pageSize,
   String strSearch,
   String tagName,
   String categoryId,
   String sortBy,
   String sortOrder = "asc"
})
 async{
    List<Product> data = new List<Product>();

    try{

      String parameter = "";

      if (strSearch != null) {
        parameter += "&search=$strSearch";
      }

      if (pageSize != null) {
        parameter += "&per_page=$pageSize";
      }

      if (pageNumber != null) {
        parameter += "&page=$pageNumber";
      }

      if (tagName != null) {
        parameter += "&tag=$tagName";
      }

      if (categoryId != null) {
        parameter += "&category=$categoryId";
      }

      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }

      if (sortOrder != null) {
        parameter += "&order=$sortOrder";
      }

      String url = Config.productFull + "${parameter.toString()}";
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if(response.statusCode == 200) {
        data = (response.data as List)
            .map(
                (i) => Product.fromJson(i),
        )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
 }
}