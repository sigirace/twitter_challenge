import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/authentication/models/user.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/users/view_models/user_view_model.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncLoading();
    final users = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(
      () async {
        final userCredential = await _authRepo.signUp(
          ref.read(signUpForm),
        );

        await users.createProfile(userCredential);
      },
    );
  }
}

final signUpForm = StateProvider<UserData>((ref) => UserData());

final signUpProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
