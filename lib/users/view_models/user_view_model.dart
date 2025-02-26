import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/authentication/view_models/singup_view_model.dart';
import 'package:twitter_challenge/users/models/user_profile_model.dart';
import 'package:twitter_challenge/users/repos/user_repo.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepo;
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<UserProfileModel> build() async {
    _userRepo = ref.read(userRepo);
    _authRepo = ref.read(authRepo);

    if (_authRepo.isLoggedIn) {
      final profileData = await _userRepo.findProfile(_authRepo.user!.uid);
      final followers = await _userRepo.findFollowers(_authRepo.user!.uid);
      final followings = await _userRepo.findFollowings(_authRepo.user!.uid);
      if (profileData != null) {
        final userProfile = UserProfileModel.fromJson(profileData).copyWith(
          followers: followers,
          followings: followings,
        );
        return userProfile;
      }
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    final userData = ref.read(signUpForm);
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncLoading();
    final userProfile = UserProfileModel(
      hasAvatar: false,
      followerCount: 0,
      followingCount: 0,
      email: userData.email ?? "Anonymous@email.com",
      name: userData.name ?? "Anonymous",
      uid: credential.user!.uid,
    );
    await _userRepo.createProfile(userProfile);
    state = AsyncValue.data(userProfile);
  }

  Future<void> onAvatarUpdated(String uid) async {
    if (state.value == null) return;
    state = AsyncValue.data(
      state.value!.copyWith(
        hasAvatar: true,
      ),
    );
    await _userRepo.updateProfile(
      state.value!.uid,
      {"hasAvatar": true},
    );
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, UserProfileModel>(
  () => UserViewModel(),
);
