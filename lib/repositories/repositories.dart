import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';

class UserRepositories {
  static String mainUrl = "https://www.a2is.fr/";
  var loginUrl = '$mainUrl/wp-json/jwt-auth/v1/token?username=Louis34&password=X:ST{b9)84kp';

  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'tokan');
    if(value != null ) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisteToken(String token) async{
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login (String email, String password) async {
    Response response = await _dio.post(loginUrl, data: {
      "email": email,
      "password": password
    });
    return response.data['token'];
  }
}