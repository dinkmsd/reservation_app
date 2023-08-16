import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/services/local_storage/app_shared_preference.dart';
import 'package:reservation_app/services/networking/authentication_services.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthLoginEvent>(_onLoginEvent);
    on<AuthGetUserInfoEvent>(_onGetUserInfoEvent);
    on<AuthCheckLoginEvent>(_onCheckLoginEvent);
    on<AuthLogoutEvent>(_onLogoutEvent);
    on<AuthInfoChanged>(_onInfoChanged);
  }

  _onLoginEvent(AuthLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    // Gọi API sau đó API trả về kết quả
    var token = await AuthenticationServices.onUserLogin(
        event.phoneNumber, event.password);

    if (token != null) {
      await AppSharedPreference.writeAccessToken(token);
      add(AuthGetUserInfoEvent(accessToken: token));
    } else {
      emit(AuthLoginFailure());
    }
  }

  _onGetUserInfoEvent(
      AuthGetUserInfoEvent event, Emitter<AuthenticationState> emit) async {
    //// Gọi API sau đó API trả về kết quả
    var userInfo =
        await AuthenticationServices.getUserInfoFromServer(event.accessToken);

    emit(AuthLoginSuccess(userData: userInfo));
  }

  _onCheckLoginEvent(
      AuthCheckLoginEvent event, Emitter<AuthenticationState> emit) async {
    var accessToken = await AppSharedPreference.readAccessToken();
    if (accessToken != null) {
      add(AuthGetUserInfoEvent(accessToken: accessToken));
    } else {
      emit(AuthLoginFailure());
    }
  }

  _onLogoutEvent(
      AuthLogoutEvent event, Emitter<AuthenticationState> emit) async {
    await AppSharedPreference.deleteAccessToken();
    await AppSharedPreference.deleteUserInfo();

    emit(AuthLogoutState());
  }

  _onInfoChanged(
      AuthInfoChanged event, Emitter<AuthenticationState> emit) async {
    if (state is AuthLoginSuccess) {
      var newState = state as AuthLoginSuccess;

      var newData = newState.userData?.copyWith(
          email: event.userModel.email,
          phone: event.userModel.phone,
          name: event.userModel.name);
      await AppSharedPreference.writeUserInfo(newData);

      emit(AuthLoginSuccess(userData: newData));
    }
  }
}
