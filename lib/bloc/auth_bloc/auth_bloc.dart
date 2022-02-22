import 'package:a2is/bloc/auth_bloc/auth_event.dart';
import 'package:a2is/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //bon
import 'auth.dart'; //bon

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepositories userRepositories;
  AuthenticationBloc ({required this.userRepositories})
    : assert(userRepositories != null), super(AuthenticationState());

  @override
  AuthenticationState get initialState => AuthenticationUnitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if(event is AppStarted) {
      final bool hasToken = await userRepositories.hasToken();
      if(hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if(event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepositories.persisteToken(event.token);
      yield AuthenticationAuthenticated();
    }
    if(event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepositories.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}