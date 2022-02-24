import 'package:a2is/utils/form_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String _username = "";
  String _pwd = "";
  bool hidePassword = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: _loginUISetup(context),
      ),
    );
  }


  Widget _loginUISetup(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        child: new Form(
          child: _loginUI(context),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height / 3.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.redAccent,
                    Colors.redAccent
                  ]
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "A2iS",
                  style: TextStyle(fontSize: 40),
                )
              ),
              Spacer()
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, top: 40),
            child: Text(
              "Connexion",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: FormHelper.inputFieldWidget(
            context,
            Icon(Icons.verified_user),
            "username",
            "Username",
             (onValidateVal) {
              if(onValidateVal.isEmpty) {
                return "Le nom d'utilisateur ne doit pas être vide.";
              }
              return null;
             },
                (onSavedValue) {
              _username = onSavedValue.toString().trim();
                },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: FormHelper.inputFieldWidget(
            context,
            Icon(Icons.lock),
            "password",
            "Password",
                (onValidateVal) {
              if(onValidateVal.isEmpty) {
                return "Le mot de passe ne doit pas être vide.";
              }
              return null;
                },
                (onSavedValue) {
              _pwd = onSavedValue.toString().trim();
                },
            initialValue: "",
            obscureText: hidePassword,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.redAccent.withOpacity(0.4),
                icon: Icon(
                  hidePassword?Icons.visibility_off : Icons.visibility
                ),
            )
          ),
        ),
        SizedBox(height: 20),
        new Center(
          child: FormHelper.saveButton(
            "Connexion",
                () {
              if(validateAndSave()) {
                
              }
                },
          ),
        )
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if(form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

}


