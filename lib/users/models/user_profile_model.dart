class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final bool hasAvatar;
  final int followerCount;
  final int followingCount;
  final List<Map<String, dynamic>>? followers;
  final List<Map<String, dynamic>>? followings;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.hasAvatar,
    required this.followerCount,
    required this.followingCount,
    this.followers,
    this.followings,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        hasAvatar = false,
        followerCount = 0,
        followingCount = 0,
        followers = [],
        followings = [];

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "hasAvatar": hasAvatar,
        "followerCount": followerCount.toInt(),
        "followingCount": followingCount.toInt(),
      };

  static UserProfileModel fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        hasAvatar: json["hasAvatar"],
        followerCount: json["followerCount"],
        followingCount: json["followingCount"],
      );

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    bool? hasAvatar,
    int? followerCount,
    int? followingCount,
    List<Map<String, dynamic>>? followers,
    List<Map<String, dynamic>>? followings,
  }) =>
      UserProfileModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        name: name ?? this.name,
        hasAvatar: hasAvatar ?? this.hasAvatar,
        followerCount: followerCount ?? this.followerCount,
        followingCount: followingCount ?? this.followingCount,
        followers: followers ?? this.followers,
        followings: followings ?? this.followings,
      );
}
