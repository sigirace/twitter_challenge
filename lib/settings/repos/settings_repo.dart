import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const String _mode = "mode";

  final SharedPreferences _preferences;

  SettingsRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    await _preferences.setBool(_mode, value);
  }

  bool getDarkMode() {
    return _preferences.getBool(_mode) ?? false;
  }
}
