  import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;
  static const secureStorage =  FlutterSecureStorage();

  static Future init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> setCache(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static String? getCache(String key) {
    return sharedPref.getString(key);
  }

  static Future<bool> removeCache(String key) async {
    return await sharedPref.remove(key);
  }

  static Future<bool> clearCache() async {
    return await sharedPref.clear();
  }
  static Future<void> setSecureCache(String key, String value) async {
    return await secureStorage.write(key: key, value: value);
  }
  static Future<String?> getSecureCache(String key) async {
    return secureStorage.read(key: key);
  }

  static Future<void> removeSecureCache(String key) async {
    return await secureStorage.delete(key: key);
  }
  static Future<void> clearSecureCache() async {
    return await secureStorage.deleteAll();
  }
}
