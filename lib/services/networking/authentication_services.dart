import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/services/local_storage/app_shared_preference.dart';

class AuthenticationServices {
  static Future<String?> onUserLogin(
      String phoneNumber, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    if (password == 'Cong@123') {
      return Future.value(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9hbm9ueW1vdXMiOiIyMmZkMGZiYi1lMzBmLTQyNjQtODA3ZC1jMTk2ZjYxMGRkMjEiLCJuYmYiOjE2NDAxNjQxNDAsImV4cCI6MTY0Mjc1NjE0MCwiaWF0IjoxNjQwMTY0MTQwLCJpc3MiOiJodHRwczovL2JhY3NpY2F5eGFuaC52bi8iLCJhdWQiOiJodHRwczovL2JhY3NpY2F5eGFuaC52bi8ifQ.RDvi6FJDdFjek9mqF3Vt6XqsvRirKMT06-3LTx48Rog');
    } else {
      return Future.value(null);
    }
  }

  static Future<UserModel> getUserInfoFromServer(String accessToken) async {
    //TODO: call api to get user info via accessToken
    //get data from server
    //user From json to return the UserModel
    await Future.delayed(const Duration(seconds: 1));

    final mock = await AppSharedPreference.readUserInfo() ?? userModelMockData;
    return Future.value(mock);
  }
}
