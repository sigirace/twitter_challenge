import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/main_navigation/widgets/dynamic_image.dart';
import 'package:twitter_challenge/main_navigation/widgets/dynamic_profile.dart';
import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../schemas.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.userImagePath,
    required this.userName,
    required this.postType,
    this.imagePaths,
    required this.postContent,
    required this.replyCount,
    required this.likeCount,
  });

  final String userImagePath;
  final String userName;
  final PostType postType;
  final List<String>? imagePaths;
  final String postContent;
  final int replyCount;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: Sizes.size60,
                        height: Sizes.size60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(Sizes.size30),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: Image.asset(
                            userImagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: Sizes.size24,
                          height: Sizes.size24,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(Sizes.size12),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                              size: FontSize.fs12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v5,
                  Expanded(
                    child: Container(
                      width: Sizes.size2,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize.fs12,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2m',
                              style: TextStyle(
                                fontSize: FontSize.fs12,
                                color: Colors.grey,
                              ),
                            ),
                            Gaps.h10,
                            FaIcon(
                              FontAwesomeIcons.ellipsis,
                              size: FontSize.fs12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v5,
                    Text(postContent),
                    Gaps.v5,
                    if (postType == PostType.image && imagePaths != null)
                      DynamicImage(
                        imagePaths: imagePaths!,
                      ),
                    Gaps.v10,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade700,
                          size: FontSize.fs16,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.message,
                          color: Colors.grey.shade700,
                          size: FontSize.fs16,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.share,
                          color: Colors.grey.shade700,
                          size: FontSize.fs16,
                        ),
                        Gaps.h20,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.grey.shade700,
                          size: FontSize.fs16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gaps.v5,
        Row(
          children: [
            Gaps.h4,
            Text('$replyCount replies'),
            Gaps.h4,
            const Text('•'),
            Gaps.h4,
            Text('$likeCount likes'),
          ],
        ),
      ],
    );
  }
}
