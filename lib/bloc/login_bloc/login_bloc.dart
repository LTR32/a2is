import 'package:a2is/bloc/auth_bloc/auth_bloc.dart';
import 'package:a2is/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../auth_bloc/auth_event.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepositories userRepositories;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepositories,
    required this.authenticationBloc
}) : assert(userRepositories != null),
     assert(authenticationBloc != null), super(LoginState());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginButtonPressed) {
      yield LoginLoading();

      try{
        final token = await userRepositories.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch(error) {
        LoginFailure(error: error.toString());
      }
    }
  }
}