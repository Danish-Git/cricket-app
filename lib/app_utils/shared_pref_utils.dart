import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String getString(String key) {
    return _preferences?.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) {
    return _preferences?.setString(key, value) ?? Future.value(false);
  }

  int getInt(String key) {
    return _preferences?.getInt(key) ?? 0;
  }

  Future<bool> setInt(String key, int value) {
    return _preferences?.setInt(key, value) ?? Future.value(false);
  }

  bool getBool(String key) {
    return _preferences?.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences?.setBool(key, value) ?? Future.value(false);
  }
}
