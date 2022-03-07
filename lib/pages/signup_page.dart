// @dart=2.9

import 'package:a2is/api_service.dart';
import 'package:a2is/models/customer.dart';
import 'package:a2is/utils/ProgressHUD.dart';
import 'package:a2is/utils/form_helper.dart';
import 'package:a2is/utils/validator_service.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  APIService apiService;
  CustomerModel model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState(){
    apiService = new APIService();
    model = new CustomerModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: Text("S'inscrire"),
      ),
      body: ProgressHUD(
        child: new Form(
          key: globalKey,
          child: _formUI(),
        ),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel("Prénom"),
                FormHelper.textInput(
                    context,
                    model.firstName,
                    (value) => {
                      this.model.firstName = value,
                    },
                  onValidate: (value) {
                      if(value.toString().isEmpty) {
                        return 'Veuillez entrer votre prénom.';
                      }
                      return null;
                  },
                ),
                FormHelper.fieldLabel("Nom"),
                FormHelper.textInput(
                  context,
                  model.lastName,
                      (value) => {
                    this.model.lastName = value,
                  },
                  onValidate: (value) {
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Email Id"),
                FormHelper.textInput(
                  context,
                  model.email,
                      (value) => {
                    this.model.email = value,
                  },
                  onValidate: (value) {
                    if(value.toString().isEmpty) {
                      return 'Veuillez entrer votre email.';
                    }

                    if(value.isNotEmpty && !value.toString().isValidEmail()) {
                      return 'Veuillez entrer une adresse mail valide';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Mot de passe"),
                FormHelper.textInput(
                  context,
                  model.password,
                      (value) => {
                    this.model.password = value,
                  },
                  onValidate: (value) {
                    if(value.toString().isEmpty) {
                      return 'Veuillez entrer votre mot de passe.';
                    }
                    return null;
                  },
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Theme.of(context).accentColor.withOpacity(0.4),
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                new Center(
                  child: FormHelper.saveButton(
                      "S'inscrire",
                      () {
                        if (validateAndSave()) {
                          print(model.toJson());
                          setState(() {
                            isApiCallProcess = true;
                          });

                          apiService.createCustomer(model).then(
                                  (ret) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if(ret) {
                                      FormHelper.showMessage(
                                          context,
                                          "Woocommerce App",
                                          "Inscription Réussie",
                                          "Ok",
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                      );
                                    } else {
                                      FormHelper.showMessage(
                                          context,
                                          "Woocommerce app",
                                          "Cette email est déjà utilisée",
                                          "Ok",
                                          () {
                                            Navigator.of(context).pop();
                                          },
                                      );
                                    }
                                  },
                          );
                        }
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

bool validateAndSave(){
    final form = globalKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    return false;
}
}
