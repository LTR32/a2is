// @dart=2.9
import 'package:a2is/api_service.dart';
import 'package:a2is/utils/form_helper.dart';
import 'package:flutter/material.dart';

import '../utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String username;
  String password;
  APIService apiService;

  @override
  void initState(){
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0,10),
                        blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25,),
                        Text(
                          "Connexion",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20,),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => username = input,
                          validator: (input) => !input.contains('@')
                            ? "L'email doit être valide"
                          : null,
                          decoration:  new InputDecoration(
                            hintText: "Adresse mail",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme.secondary
                                    .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme.secondary)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        new TextFormField(
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => password = input,
                          validator: (input) => input.length < 3
                          ? "Le mot de passe doit avoir au moins 3 caractères"
                          : null,
                          obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Mot de passe",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme.secondary
                                      .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                .colorScheme.secondary
                                .withOpacity(0.4),
                                icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                              ),
                            ),
                        ),
                        SizedBox(height: 30,),
                        FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                            onPressed: (){
                              if(validateAndSave()) {
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                apiService.loginCustomer(username, password).then(
                                    (ret) => {
                                      if(ret != null) {
                                        setState(() {
                                          isApiCallProcess = false;
                                        }),

                                        FormHelper.showMessage(
                                            context,
                                            "Woocommerce App",
                                            "Connexion réussie",
                                            "Ok",
                                            () {
                                              Navigator.of(context).pop();
                                            }
                                        ),
                                      } else {
                                        FormHelper.showMessage(
                                            context,
                                            "Woocommerce App",
                                            "Identifiants invalides",
                                            "Ok",
                                            () {
                                              Navigator.of(context).pop();
                                            }
                                        ),
                                    }
                                    }
                                );
                              }
                            },
                            child: Text(
                              "Connexion",
                              style: TextStyle(color: Colors.white),
                            ),
                        color: Theme.of(context).colorScheme.secondary,
                            shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }
}
