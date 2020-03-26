import 'package:domestic_budget_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends Disposable {
  factory LocalStorageService.getInstance() =>
      AppModule.to.get<LocalStorageService>();
  LocalStorageService();

  Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  void setBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<double> getDouble(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  void setDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  void setInt(String key, int value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  void setString(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<List<String>> getStringList(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  void setListString(String key, List<String> value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setStringList(key, value);
    }
  }

  Future<Set<String>> getKeys() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  Future<bool> remove(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> containsKey(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
