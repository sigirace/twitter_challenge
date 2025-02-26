import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final user = await _db.collection("users").doc(uid).get();
    return user.data();
  }

  Future<List<Map<String, dynamic>>> findFollowers(String uid) async {
    final followers =
        await _db.collection("users").doc(uid).collection("followers").get();
    return followers.docs
        .map(
          (e) => {
            "uid": e.id,
            "hasAvatar": e.data()["hasAvatar"],
          },
        )
        .toList();
  }

  Future<List<Map<String, dynamic>>> findFollowings(String uid) async {
    final followings =
        await _db.collection("users").doc(uid).collection("followings").get();
    return followings.docs
        .map(
          (e) => {
            "uid": e.id,
            "hasAvatar": e.data()["hasAvatar"],
          },
        )
        .toList();
  }

  Future<void> updateAvatar(String fileName, File file) async {
    final storageRef = _storage.ref().child('avatars/$fileName');
    await storageRef.putFile(file);
  }

  Future<void> updateProfile(String uid, Map<String, dynamic> data) async {
    await _db.collection("users").doc(uid).update(data);
  }
}

final userRepo = Provider(
  (ref) => UserRepository(),
);
