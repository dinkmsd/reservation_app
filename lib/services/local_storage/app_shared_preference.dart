import 'dart:convert';

import 'package:reservation_app/data/user_model.dart';
import 'package:reservation_app/utils/storage_key_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static writeOnBoardingData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StorageKeyManagement.isShownOnBoarding, true);
  }

  static Future<bool?> readOnBoardingData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(StorageKeyManagement.isShownOnBoarding);
  }

  static writeAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeyManagement.accessTokenKey, accessToken);
  }

  static Future<String?> readAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageKeyManagement.accessTokenKey);
  }

  static Future<void> deleteAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeyManagement.accessTokenKey);
  }

  static Future<UserModel?> readUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(StorageKeyManagement.userInfoData);
    if (user == null) return Future.value(null);
    var json = jsonDecode(user) as Map<String, dynamic>;
    var userModal = UserModel.fromJson(json);
    return Future.value(userModal);
  }

  static Future<void> writeUserInfo(UserModel? userInfo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = jsonEncode(userInfo?.toJson());
    await prefs.setString(StorageKeyManagement.userInfoData, value);
  }

  static Future<void> deleteUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeyManagement.userInfoData);
  }
}
