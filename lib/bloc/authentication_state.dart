part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthLoginSuccess extends AuthenticationState {
  final UserModel? userData;

  AuthLoginSuccess({this.userData});
}

class AuthLoginFailure extends AuthenticationState {}

class AuthLogoutState extends AuthenticationState {}
