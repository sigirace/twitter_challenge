import 'package:flutter/material.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';

class FollowingWidget extends StatelessWidget {
  const FollowingWidget({
    super.key,
    required this.isFollowing,
  });

  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width.w88,
      height: Height.h26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Sizes.size10)),
        border: Border.all(
          color: isFollowing ? Colors.blue : Colors.grey.shade500,
        ),
        color: isFollowing ? Colors.blue : Colors.white,
      ),
      child: isFollowing
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
    );
  }
}
