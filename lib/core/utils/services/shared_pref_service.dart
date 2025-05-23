import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setString({required String key, required String value}) async =>
      _prefs?.setString(key, value);

  String? getString(String key) => _prefs?.getString(key);

  Future<void> remove(String key) async => await _prefs?.remove(key);
}
