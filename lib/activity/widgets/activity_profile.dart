import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/sizes.dart';

class ActivityProfileWidget extends StatelessWidget {
  const ActivityProfileWidget({
    super.key,
    required this.profileImage,
    required this.activityType,
  });

  final String profileImage;
  final String activityType;

  Color _getBackgroundColor() {
    switch (activityType) {
      case "Mentions":
        return Colors.blue;
      case "Share":
        return Colors.green;
      case "Follow":
        return Colors.purple;
      case "Likes":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  IconData _getActivityIcon() {
    switch (activityType) {
      case "Mentions":
        return FontAwesomeIcons.at;
      case "Share":
        return FontAwesomeIcons.share;
      case "Follow":
        return FontAwesomeIcons.userPlus;
      case "Likes":
        return FontAwesomeIcons.heart;
      default:
        return FontAwesomeIcons.at;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profileImage),
          radius: Sizes.size24,
        ),
        Positioned(
          bottom: 0,
          right: -Sizes.size8,
          child: Container(
            height: Sizes.size24,
            width: Sizes.size24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: Sizes.size2,
              ),
            ),
            child: FaIcon(
              _getActivityIcon(),
              color: Colors.white,
              size: Sizes.size10,
            ),
          ),
        ),
      ],
    );
  }
}
