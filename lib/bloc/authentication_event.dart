part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthLoginEvent extends AuthenticationEvent {
  final String phoneNumber;
  final String password;

  AuthLoginEvent({required this.phoneNumber, required this.password});
}

class AuthGetUserInfoEvent extends AuthenticationEvent {
  final String accessToken;

  AuthGetUserInfoEvent({required this.accessToken});
}

class AuthCheckLoginEvent extends AuthenticationEvent {}

class AuthLogoutEvent extends AuthenticationEvent {}

class AuthInfoChanged extends AuthenticationEvent {
  final UserModel userModel;

  AuthInfoChanged({required this.userModel});
}
