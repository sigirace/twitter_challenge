enum PostType {
  image,
  video,
  text,
  innerPost,
}

enum InnerPostType {
  image,
  video,
  text,
}

class PostData {
  final String postId;
  final String userImagePath;
  final String userName;
  final String postContent;
  final List<String>? imagePaths;
  final int replyCount;
  final int likeCount;
  final List<String> likeUserImagePaths;
  final PostType postType;
  final InnerPostData? innerPostData;
  final ReplyData? replyData;

  PostData({
    required this.postId,
    required this.userImagePath,
    required this.userName,
    required this.postContent,
    this.imagePaths,
    required this.replyCount,
    required this.likeCount,
    required this.likeUserImagePaths,
    required this.postType,
    this.innerPostData,
    this.replyData,
  });
}

class InnerPostData {
  final String postId;
  final String userImagePath;
  final String userName;
  final String postContent;
  final List<String>? imagePaths;
  final InnerPostType postType;
  final int replyCount;

  InnerPostData({
    required this.postId,
    required this.userImagePath,
    required this.userName,
    required this.postContent,
    this.imagePaths,
    required this.postType,
    required this.replyCount,
  });
}

class ReplyData {
  final String replyId;
  final String userImagePath;
  final String userName;
  final String replyContent;

  ReplyData({
    required this.replyId,
    required this.userImagePath,
    required this.userName,
    required this.replyContent,
  });
}
