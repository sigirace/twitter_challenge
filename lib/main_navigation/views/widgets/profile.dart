import 'package:flutter/material.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.user,
    required this.widthSize,
    required this.heightSize,
    required this.borderRadius,
  });

  final Map<String, dynamic> user;
  final double widthSize;
  final double heightSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: user["hasAvatar"]
          ? Image.network(
              "https://firebasestorage.googleapis.com/v0/b/tiktok-sigi.firebasestorage.app/o/avatars%2F${user["uid"]}?alt=media&token=468a64af-7f46-46be-99ba-b01f9d06038b",
              fit: BoxFit.cover,
            )
          : Image.asset(
              "assets/images/user/no_user.jpg",
              fit: BoxFit.cover,
            ),
    );
  }
}
