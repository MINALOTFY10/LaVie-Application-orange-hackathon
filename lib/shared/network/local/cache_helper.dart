import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {


  // static SharedPreferences sharedPreferences;
  //
  // static init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  static Future<SharedPreferences> get _instance async => sharedPreferences ??= await SharedPreferences.getInstance();
  static SharedPreferences? sharedPreferences;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    sharedPreferences = await _instance;
    return sharedPreferences;
  }

  static String getString(SharedKeys key, [String? defValue]) {
    return sharedPreferences?.getString(key.name) ?? defValue ?? "";
  }

  static Future<bool> setString(SharedKeys key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key.name, value);
  }


  // static Future<bool?> putBoolean({
  //   required String key,
  //   required bool value,
  // }) async {
  //   return await sharedPreferences?.setBool(key, value);
  // }
  //
  // static dynamic getData({
  //   required String key,
  // }) {
  //   return sharedPreferences?.get(key);
  // }
  //
  // static Future<bool?> saveData({
  //   required String key,
  //   @required dynamic value,
  // }) async {
  //   if (value is String) return await sharedPreferences?.setString(key, value);
  //   if (value is int) return await sharedPreferences?.setInt(key, value);
  //   if (value is bool) return await sharedPreferences?.setBool(key, value);
  //
  //   return await sharedPreferences?.setDouble(key, value);
  // }
  //
  // static Future<bool?> removeData({
  //   required String key,
  // }) async {
  //   return await sharedPreferences?.remove(key);
  // }
}
enum SharedKeys {
  username,
  userId,
  theme,
  language,
  apiToken,
}