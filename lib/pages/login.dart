import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email)
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.login, size: 18,), label: Text("Connexion"),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async{}
}
