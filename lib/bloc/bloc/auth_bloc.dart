// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }
  void _onAuthLoginRequested(AuthLoginRequest event, Emitter emit) async {
    emit(Authloading());
    try {
      final email = event.email;
      final password = event.password;

      // Regex for email validation
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

      if (!emailRegex.hasMatch(email)) {
        return emit(AuthLoginFailure("Invalid email format"));
      }
      if (password.length < 6) {
        return emit(AuthLoginFailure("Password length is less than 6"));
      }

      await Future.delayed(Duration(seconds: 1));
      return emit(AuthLoginSuccessful(uid: '$email - $password'));
    } catch (e) {
      return emit(AuthLoginFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(AuthLogoutRequested event, Emitter emit) async {
    emit(Authloading());
    try {
      await Future.delayed(Duration(seconds: 1));
      return emit(AuthInitial());
    } catch (e) {
      return emit(AuthLoginFailure(e.toString()));
    }
  }
}
