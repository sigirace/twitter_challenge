import 'package:flutter/material.dart';
import 'package:twitter_challenge/activity/widgets/activity_profile.dart';
import 'package:twitter_challenge/utils/mode.dart';
import 'package:twitter_challenge/widgets/follwoing.dart';

import '../../constants/fontsize.dart';
import '../../schemas/activity_schema.dart';

class ActivityItemWidget extends StatelessWidget {
  const ActivityItemWidget({super.key, required this.activity});
  final ActivitySchema activity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ActivityProfileWidget(
        profileImage: activity.userProfileImage,
        activityType: activity.activityType,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: activity.userName,
              style: TextStyle(
                fontSize: FontSize.fs12,
                fontWeight: FontWeight.w600,
                color:
                    isDarkMode(context) ? Colors.grey.shade400 : Colors.black,
              ),
            ),
            TextSpan(
              text: ' ${activity.time}h',
              style: TextStyle(
                fontSize: FontSize.fs12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      subtitle: Wrap(
        children: [
          Text(
            activity.subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (activity.additionalInfo != null)
            Text(
              activity.additionalInfo!,
              style: TextStyle(
                color:
                    isDarkMode(context) ? Colors.grey.shade400 : Colors.black,
              ),
            ),
        ],
      ),
      trailing: activity.isFollowing != null
          ? FollowingWidget(isFollowing: activity.isFollowing!)
          : null,
    );
  }
}
