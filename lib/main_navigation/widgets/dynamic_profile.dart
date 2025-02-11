import 'package:flutter/material.dart';
import 'package:twitter_challenge/main_navigation/widgets/profile.dart';

import '../../constants/sizes.dart';

class DynamicProfile extends StatelessWidget {
  const DynamicProfile({
    super.key,
    required this.userImagePaths,
    this.leftOffset,
    this.rightOffset,
  });

  final List<String> userImagePaths;
  final double? leftOffset;
  final double? rightOffset;

  @override
  Widget build(BuildContext context) {
    return userImagePaths.length == 1
        ? Center(
            child: Profile(
              userImagePath: userImagePaths[0],
              widthSize: Sizes.size30,
              heightSize: Sizes.size30,
              borderRadius: Sizes.size15,
            ),
          )
        : userImagePaths.length == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(leftOffset ?? 5, 0),
                    child: Profile(
                      userImagePath: userImagePaths[0],
                      widthSize: Sizes.size28,
                      heightSize: Sizes.size28,
                      borderRadius: Sizes.size14,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(rightOffset ?? -5, 0),
                    child: Stack(
                      alignment: Alignment.center, // 테두리와 이미지를 정렬
                      children: [
                        Container(
                          width: Sizes.size26 + Sizes.size6,
                          height: Sizes.size26 + Sizes.size6,
                          decoration: BoxDecoration(
                            color: Colors.white, // 테두리 색상
                            borderRadius: BorderRadius.circular(
                              Sizes.size13 + Sizes.size6,
                            ),
                          ),
                        ),
                        Profile(
                          userImagePath: userImagePaths[1],
                          widthSize: Sizes.size28,
                          heightSize: Sizes.size28,
                          borderRadius: Sizes.size14,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 10,
                    child: Profile(
                      userImagePath: userImagePaths[0],
                      widthSize: Sizes.size28,
                      heightSize: Sizes.size28,
                      borderRadius: Sizes.size14,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Profile(
                      userImagePath: userImagePaths[1],
                      widthSize: Sizes.size30,
                      heightSize: Sizes.size30,
                      borderRadius: Sizes.size15,
                    ),
                  ),
                  Positioned(
                    right: 14,
                    bottom: 0,
                    child: Profile(
                      userImagePath: userImagePaths[2],
                      widthSize: Sizes.size20,
                      heightSize: Sizes.size20,
                      borderRadius: Sizes.size10,
                    ),
                  ),
                ],
              );
  }
}
