import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setString(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getBool(key) ?? true;
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setBool(key, value);
  }
}
