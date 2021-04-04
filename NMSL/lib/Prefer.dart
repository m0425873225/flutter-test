import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final SharedPreferences prefs;

  Prefs({this.prefs});

  setPrefsValues({
    String key,
    var value,
  }) {
    if (value is String) {
      this.prefs.setString(key, value);
    }
    if (value is int) {
      this.prefs.setInt(key, value);
    }
    if (value is double) {
      this.prefs.setDouble(key, value);
    }
    if (value is bool) {
      this.prefs.setBool(key, value);
    }
  }

  getPrefValues({
    String key,
    String type,
  }) {
    if (type == "String") {
      return this.prefs.getString(key);
    }
    if (type == "int") {
      return this.prefs.getInt(key);
    }
    if (type == "double") {
      return this.prefs.getDouble(key);
    }
    if (type == "bool") {
      return this.prefs.getBool(key);
    }
  }
}