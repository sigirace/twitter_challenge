enum PostType {
  image,
  video,
  text,
}

class PostData {
  final String userImagePath;
  final String userName;
  final String postContent;
  final List<String>? imagePaths;
  final int replyCount;
  final int likeCount;
  final List<String> likeUserImagePaths;
  final PostType postType;

  PostData({
    required this.userImagePath,
    required this.userName,
    required this.postContent,
    this.imagePaths,
    required this.replyCount,
    required this.likeCount,
    required this.likeUserImagePaths,
    required this.postType,
  });
}
