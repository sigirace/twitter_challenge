import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/settings/models/settings_model.dart';
import 'package:twitter_challenge/settings/repos/settings_repo.dart';

class SettingsViewModel extends Notifier<SettingsModel> {
  final SettingsRepository _repository;

  SettingsViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = SettingsModel(
      isDarkMode: value,
    );
  }

  @override
  SettingsModel build() {
    return SettingsModel(
      isDarkMode: _repository.getDarkMode(),
    );
  }
}

final settingsViewModelProvider =
    NotifierProvider<SettingsViewModel, SettingsModel>(
  () => throw UnimplementedError(),
);
