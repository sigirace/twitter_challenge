import 'package:flutter/material.dart';
import 'package:twitter_challenge/settings/models/settings_model.dart';
import 'package:twitter_challenge/settings/repos/settings_repo.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsRepository _repository;
  late final SettingsModel _model =
      SettingsModel(isDarkMode: _repository.getDarkMode());

  SettingsViewModel(this._repository);

  void toggleDarkMode() {
    _repository.setDarkMode(!_model.isDarkMode);
    _model.isDarkMode = _repository.getDarkMode();
    notifyListeners();
  }

  SettingsModel get model => _model;
}
