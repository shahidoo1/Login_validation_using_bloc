part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoginSuccessful extends AuthState {
  final String uid;

  AuthLoginSuccessful({required this.uid});
}

class AuthLoginFailure extends AuthState {
  final String error;

  AuthLoginFailure(this.error);
}

class Authloading extends AuthState {}
