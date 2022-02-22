import 'package:a2is/bloc/auth_bloc/auth.dart';
import 'package:a2is/bloc/login_bloc/login_bloc.dart';
import 'package:a2is/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepositories userRepositories;

  LoginScreen({Key? key, required this.userRepositories}) : assert (userRepositories != null),
  super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) {
        return LoginBloc(userRepositories: userRepositories, authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
      },
      child: LoginScreen(userRepositories: userRepositories,)
      ),
    )
  }
}
