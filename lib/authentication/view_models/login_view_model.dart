import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/main_navigation/views/main_screen.dart';
import 'package:twitter_challenge/utils/firebase_utils.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  Future<void> build() async {
    _authRepo = ref.watch(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signIn(email, password);
    });

    if (context.mounted) {
      if (state.hasError) {
        showFirebaseErrorSnack(context, state.error as FirebaseException);
      } else {
        context.go(MainScreen.routeURL);
      }
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signOut();
    });
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
