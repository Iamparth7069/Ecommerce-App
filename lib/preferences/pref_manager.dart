import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const String IS_LOGIN = "isLogin";
  static const String IS_VISITED = "isVisited";
  static const String emails1 = "Emails";

  static late SharedPreferences _preferences;

  static Future<SharedPreferences?> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static void updateLoginStatus(bool status) async {
    await _preferences.setBool(IS_LOGIN, status);
  }

  static bool getLoginStatus() {
    return _preferences.getBool(IS_LOGIN) ?? false;
  }

  static void updateOnboardingStatus(bool status) async {
    await _preferences.setBool(IS_VISITED, status);
  }

  static bool getVisitedStatus() {
    return _preferences.getBool(IS_VISITED) ?? false;
  }

  static Future<void> clearData() async {
    await _preferences.clear();
  }

  static Future<void> logout() async {
    await _preferences.remove(IS_LOGIN);
  }

  static void setStrint(String Email)async{
    await _preferences.setString(emails1, Email);
  }

  static String getName(){
    return _preferences.getString(emails1) ?? "";
  }

}
