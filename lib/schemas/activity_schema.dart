class ActivitySchema {
  final String activtyId;
  final String activityType;
  final String userProfileImage;
  final String userName;
  final String subTitle;
  final String? additionalInfo;
  final bool? isFollowing;
  final int time;

  ActivitySchema({
    required this.activtyId,
    required this.activityType,
    required this.userProfileImage,
    required this.userName,
    required this.subTitle,
    this.additionalInfo,
    this.isFollowing,
    required this.time,
  });
}
