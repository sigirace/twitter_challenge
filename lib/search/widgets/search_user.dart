import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      trailing: Container(
        width: Sizes.size80,
        height: Sizes.size35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.size10)),
          border: Border.all(
            color:
                userSearchData.isFollowing ? Colors.blue : Colors.grey.shade500,
          ),
          color: userSearchData.isFollowing ? Colors.blue : Colors.white,
        ),
        child: userSearchData.isFollowing
            ? Text(
                "Following",
                style: TextStyle(
                  fontSize: FontSize.fs12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                "Follow",
                style: TextStyle(
                  fontSize: FontSize.fs12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      isThreeLine: true,
    );
  }
}
