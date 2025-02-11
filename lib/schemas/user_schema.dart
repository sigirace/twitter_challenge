class UserSearchData {
  final int userId;
  final String userImagePath;
  final String userName;
  final String message;
  final bool blueCheck;
  final int followerCount;
  final bool isFollowing;
  final bool isOnline;

  UserSearchData({
    required this.userId,
    required this.userImagePath,
    required this.userName,
    required this.message,
    required this.blueCheck,
    required this.followerCount,
    required this.isFollowing,
    required this.isOnline,
  });
}

class UserProfileData {
  final int userId;
  final String userImagePath;
  final String userName;
  final String fullName;
  final String message;
  final int followerCount;
  final List<String>? followerImagePaths;

  UserProfileData({
    required this.userId,
    required this.userImagePath,
    required this.userName,
    required this.fullName,
    required this.message,
    required this.followerCount,
    this.followerImagePaths,
  });
}
