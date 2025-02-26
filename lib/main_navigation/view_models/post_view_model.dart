import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:twitter_challenge/main_navigation/repos/post_repo.dart';
import 'package:twitter_challenge/users/view_models/user_view_model.dart';
import 'package:uuid/uuid.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepo;
  var type = PostType.text;
  var uuid = const Uuid();

  @override
  FutureOr<void> build() {
    _postRepo = ref.read(postRepo);
  }

  Future<void> uploadPost({
    required String content,
    required File? image,
  }) async {
    final userProfile = ref.read(userProvider).value;
    if (userProfile != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        var post = PostModel(
          postId: uuid.v4(),
          content: content,
          type: type,
          createUser: userProfile.uid,
          createUserName: userProfile.name,
          hasAvatar: userProfile.hasAvatar,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          likeCount: 0,
          replyCount: 0,
        );

        if (image != null) {
          type = PostType.image;
          final task = await _postRepo.uploadPostImage(image, userProfile.uid);
          if (task.metadata != null) {
            post = post.copyWith(
              imageUrls: await task.ref.getDownloadURL(),
              type: PostType.image,
            );
          }
        }

        await _postRepo.createPost(post);
      });
    }
  }
}

final postViewModel = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
