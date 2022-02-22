import 'package:a2is/bloc/login_bloc/login_bloc.dart';
import 'package:a2is/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';

class LoginForm extends StatefulWidget {
  final UserRepositories userRepositories;
  LoginForm({Key? key, required this.userRepositories})
  : assert(userRepositories != null),
  super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState(userRepositories);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepositories userRepositories;
  _LoginFormState(this.userRepositories);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text
      ));
    }

    return BlocListener(
        listener: (context, state) {
          if(state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Login Failed.'),backgroundColor: Colors.red,
              )
            );
          }
        },
      child: BlocBuilder(builder: (context, state) {
        return Padding(padding: EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 80.0
        ),
        child: Form(
          child: Column(
            children: [
              Container(
                height: 200.0,
                padding: EdgeInsets.only(
                  bottom: 20.0,
                  top: 40.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AUTH WITH REST", style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0
                    ),),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Login app using BLOC pattern and REST API', style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black38
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.black26,),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  )
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),
                controller: _passwordController,
                decoration: InputDecoration(
                    prefixIcon: Icon(EvaIcons.emailOutline, color: Colors.black26,),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black12
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.mainColor
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500
                    )
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text('Forgot password ?', style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12.0
                  ),),
                  onTap: () {},
                ),
              ),
              Padding(padding: EdgeInsets.only(
                  top: 30.0,
                  bottom: 20.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 45.0,
                    child: state is LoginLoading ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25.0,
                                  width: 25.0,
                                  child: CupertinoActivityIndicator(),
                                )
                              ],
                            ),
                          )
                        ],
                      ) : RaisedButton(
                        onPressed: _onLoginButtonPressed,
                    color: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Text('LOG IN', style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    ),
                  )
                ],
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('or connect using', style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12.0
                  ),)
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.0,
                    width: 180.0,
                    child: RaisedButton(onPressed: (){},
                    color: Color(0xFF385C8E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                      ],
                    ),),
                  )
                ],
              )
            ],
          )
        ),
        );
      }),
    );
  }
}
