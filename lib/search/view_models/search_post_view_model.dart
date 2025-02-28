import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:twitter_challenge/main_navigation/repos/post_repo.dart';

class SearchPostViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepository _postRepo;

  @override
  FutureOr<List<PostModel>> build() {
    _postRepo = ref.read(postRepo);
    return [];
  }

  Future<void> searchPosts(String query) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final posts = await _postRepo.searchPosts(query);
      final postModels = posts
          .map((post) => PostModel.fromJson(json: post, postId: post["postId"]))
          .toList();
      return postModels;
    });
  }
}

final searchPostViewModelProvider =
    AsyncNotifierProvider<SearchPostViewModel, List<PostModel>>(
  () => SearchPostViewModel(),
);
