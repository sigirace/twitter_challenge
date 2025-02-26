import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:twitter_challenge/main_navigation/repos/post_repo.dart';

class PostScreenViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepository _postRepo;
  late final AuthenticationRepository _authRepo;

  final List<PostModel> _postModels = [];

  Future<List<PostModel>> _fetchPosts({int? lastItemCreatedAt}) async {
    final result =
        await _postRepo.fetchPosts(lastItemCreatedAt: lastItemCreatedAt);

    final postModels = result.docs.map(
      (doc) => PostModel.fromJson(
        json: doc.data(),
        postId: doc.id,
      ),
    );
    return postModels.toList();
  }

  @override
  FutureOr<List<PostModel>> build() async {
    _postRepo = ref.read(postRepo);
    _authRepo = ref.read(authRepo);

    final posts = await _postRepo.getPosts();
    if (posts.isEmpty) {
      return [];
    }

    final postModels = await _fetchPosts(lastItemCreatedAt: null);

    for (var post in postModels) {
      final metaData = await getMetaData(post.postId);

      final updatedPost = post.copyWith(
        likes: metaData["likes"],
        replies: metaData["replies"],
      );

      _postModels.add(updatedPost);
    }

    return _postModels;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final postModels = await _fetchPosts(lastItemCreatedAt: null);
    for (var post in postModels) {
      final metaData = await getMetaData(post.postId);
      final updatedPost = post.copyWith(
        likes: metaData["likes"],
        replies: metaData["replies"],
      );
      _postModels.add(updatedPost);
    }

    state = AsyncValue.data(postModels);
  }

  Future<Map<String, dynamic>> getMetaData(String postId) async {
    return await _postRepo.getPostMetaData(postId);
  }
}

final postScreenViewModel =
    AsyncNotifierProvider<PostScreenViewModel, List<PostModel>>(
  () => PostScreenViewModel(),
);
