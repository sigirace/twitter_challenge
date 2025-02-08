import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/widgets/follwoing.dart';

import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../schemas/user_schema.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({
    super.key,
    required this.userSearchData,
  });

  final UserSearchData userSearchData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(userSearchData.userImagePath),
      ),
      title: Row(
        children: [
          Text(
            userSearchData.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: FontSize.fs14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.h5,
          if (userSearchData.blueCheck)
            const FaIcon(
              FontAwesomeIcons.heartCircleCheck,
              color: Colors.blue,
              size: Sizes.size14,
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userSearchData.message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gaps.v5,
          Text(
            '${userSearchData.followerCount} followers',
            style: TextStyle(
              fontSize: FontSize.fs12,
              color: Colors.black,
            ),
          ),
        ],
      ),
      trailing: FollowingWidget(isFollowing: userSearchData.isFollowing),
      isThreeLine: true,
    );
  }
}
