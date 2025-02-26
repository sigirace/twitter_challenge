enum PostType {
  text,
  image,
  video,
  innerPost,
}

enum InnerPostType {
  image,
  video,
  text,
}

class PostModel {
  final String postId;
  final String content;
  final PostType type;
  final int likeCount;
  final int replyCount;
  final String createUser;
  final String createUserName;
  final bool hasAvatar;
  final String? imageUrls;
  final int createdAt;
  final List<Map<String, dynamic>>? likes;
  final List<Map<String, dynamic>>? replies;

  PostModel({
    required this.postId,
    required this.content,
    required this.type,
    required this.createUser,
    required this.createUserName,
    required this.createdAt,
    required this.likeCount,
    required this.replyCount,
    required this.hasAvatar,
    this.imageUrls,
    this.likes,
    this.replies,
  });

  PostModel.empty()
      : postId = "",
        content = "",
        type = PostType.text,
        createUser = "",
        createUserName = "",
        createdAt = DateTime.now().millisecondsSinceEpoch,
        likeCount = 0,
        replyCount = 0,
        hasAvatar = false,
        imageUrls = null,
        likes = [],
        replies = [];

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "content": content,
        "type": type.name,
        "createUser": createUser,
        "createUserName": createUserName,
        "createdAt": createdAt,
        "likeCount": likeCount,
        "replyCount": replyCount,
        "hasAvatar": hasAvatar,
        "imageUrls": imageUrls,
      };

  static PostModel fromJson({
    required Map<String, dynamic> json,
    required String postId,
  }) =>
      PostModel(
        postId: postId,
        content: json["content"],
        type: PostType.values.byName(json["type"]),
        createUser: json["createUser"],
        createUserName: json["createUserName"],
        createdAt: json['createdAt'],
        likeCount: json["likeCount"],
        replyCount: json["replyCount"],
        hasAvatar: json["hasAvatar"],
        imageUrls: json["imageUrls"],
      );

  PostModel copyWith({
    String? postId,
    String? content,
    PostType? type,
    int? likeCount,
    int? replyCount,
    String? createUser,
    String? createUserName,
    int? createdAt,
    List<Map<String, dynamic>>? likes,
    List<Map<String, dynamic>>? replies,
    bool? hasAvatar,
    String? imageUrls,
  }) =>
      PostModel(
        postId: postId ?? this.postId,
        content: content ?? this.content,
        type: type ?? this.type,
        createUser: createUser ?? this.createUser,
        createUserName: createUserName ?? this.createUserName,
        createdAt: createdAt ?? this.createdAt,
        likeCount: likeCount ?? this.likeCount,
        replyCount: replyCount ?? this.replyCount,
        hasAvatar: hasAvatar ?? this.hasAvatar,
        imageUrls: imageUrls ?? this.imageUrls,
        likes: likes ?? this.likes,
        replies: replies ?? this.replies,
      );
}
