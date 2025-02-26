import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/users/repos/user_repo.dart';
import 'package:twitter_challenge/users/view_models/user_view_model.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _repository;

  @override
  FutureOr build() {
    _repository = ref.read(userRepo);
  }

  Future<void> updateAvatar(File file) async {
    final fileName = ref.read(authRepo).user!.uid;
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        await _repository.updateAvatar(fileName, file);
        await ref.read(userProvider.notifier).onAvatarUpdated(fileName);
      },
    );
  }
}

final avatarViewModel = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
