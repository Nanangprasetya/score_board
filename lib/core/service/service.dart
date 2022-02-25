import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService();

  SharedPreferences _prefs;

  Future<void> getSharedPreferences() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> setInt(String key, int value) async {
    await getSharedPreferences();
    _prefs.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    try {
      await getSharedPreferences();

      final data = _prefs.getInt(key);
      return data;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<void> setBool(String key, bool value) async {
    await getSharedPreferences();
    _prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    try {
      await getSharedPreferences();

      final data = _prefs.getBool(key);
      return data;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> remove(String key) async {
    await getSharedPreferences();

    try {
      final data = _prefs.remove(key);
      return data;
    } catch (e) {
      return false;
    }
  }
}
