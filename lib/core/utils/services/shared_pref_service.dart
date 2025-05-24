import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences? _prefs;

  SharedPrefService(this._prefs);

  Future<void> setString({required String key, required String value}) async =>
      _prefs?.setString(key, value);

  String? getString(String key) => _prefs?.getString(key);

  Future<void> remove(String key) async => await _prefs?.remove(key);
}
