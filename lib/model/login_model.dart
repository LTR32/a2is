import 'dart:convert';

import 'package:flutter_wordpress/schemas/wordpress_error.dart';

loginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  bool success;
  int statusCode;
  String code;
  String message;
  Data data;

  LoginResponseModel(

      )
}