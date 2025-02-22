import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/authentication/models/user.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        await _authRepo.signUp(
          ref.read(signUpForm),
        );
      },
    );
  }
}

final signUpForm = StateProvider<UserData>((ref) => UserData());

final signUpProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
