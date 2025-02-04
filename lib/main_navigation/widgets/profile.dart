import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.userImagePath,
    required this.widthSize,
    required this.heightSize,
    required this.borderRadius,
  });

  final String userImagePath;
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
      child: Image.asset(
        userImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
