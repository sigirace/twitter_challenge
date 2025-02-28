import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_challenge/users/models/user_profile_model.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createPost(PostModel post) async {
    await _firestore.collection("posts").doc(post.postId).set(post.toJson());
  }

  Future<List<Map<String, dynamic>>> getPosts() async {
    final posts = await _firestore.collection("posts").get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  Future<Map<String, dynamic>> getPostMetaData(String postId) async {
    final likes = await _firestore
        .collection("posts")
        .doc(postId)
        .collection("likes")
        .get();
    final replies = await _firestore
        .collection("posts")
        .doc(postId)
        .collection("replies")
        .get();

    return {
      "likes": likes.docs.map((doc) => doc.data()).toList(),
      "replies": replies.docs.map((doc) => doc.data()).toList(),
    };
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPosts({
    int? lastItemCreatedAt,
  }) {
    final query = _firestore
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .limit(5);
    if (lastItemCreatedAt != null) {
      return query.startAfter([lastItemCreatedAt]).get();
    } else {
      return query.get();
    }
  }

  UploadTask uploadPostImage(File image, String uid) {
    final fileRef = _storage.ref(
      "/images/$uid/${DateTime.now().millisecondsSinceEpoch}",
    );
    return fileRef.putFile(image);
  }

  Future<void> savePost(PostModel post) async {
    await _firestore.collection("posts").doc(post.postId).set(post.toJson());
  }

  Future<List<Map<String, dynamic>>> searchPosts(String query) async {
    final posts = await _firestore
        .collection("posts")
        .orderBy("content")
        .startAt([query]).endAt(["$query\uf8ff"]).get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  // Future<List<PostModel>> getPostsByUser(String uid) async {
  //   final posts = await _firestore
  //       .collection("posts")
  //       .where("createUser", isEqualTo: uid)
  //       .get();
  //   return posts.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
  // }
}

final postRepo = Provider(
  (ref) => PostRepository(),
);
