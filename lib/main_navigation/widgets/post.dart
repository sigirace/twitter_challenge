import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/main_navigation/widgets/dynamic_image.dart';
import 'package:twitter_challenge/main_navigation/widgets/dynamic_profile.dart';
import 'package:twitter_challenge/main_navigation/widgets/profile.dart';
import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../schemas.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.postData,
    required this.onEllipsisTap,
  });

  final PostData postData;
  final VoidCallback onEllipsisTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Gaps.v10,
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Profile(
                          userImagePath: postData.userImagePath,
                          widthSize: Sizes.size60,
                          heightSize: Sizes.size60,
                          borderRadius: Sizes.size30,
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
                            postData.userName,
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
                              GestureDetector(
                                onTap: onEllipsisTap,
                                child: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: FontSize.fs12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gaps.v5,
                      Text(postData.postContent),
                      Gaps.v5,
                      if (postData.postType == PostType.image &&
                          postData.imagePaths != null)
                        DynamicImage(
                          imagePaths: postData.imagePaths!,
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
              SizedBox(
                width: Sizes.size60,
                height: Sizes.size50,
                child: DynamicProfile(
                  userImagePaths: postData.likeUserImagePaths,
                ),
              ),
              Gaps.h4,
              Text('${postData.replyCount} replies'),
              Gaps.h4,
              const Text('•'),
              Gaps.h4,
              Text('${postData.likeCount} likes'),
            ],
          ),
          Gaps.v5,
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
