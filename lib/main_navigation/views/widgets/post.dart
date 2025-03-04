import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/dynamic_image.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/dynamic_profile.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/inner_post.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/profile.dart';
import '../../../constants/fontsize.dart';
import '../../../constants/gaps.dart';
import '../../../schemas/post_schema.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.postData,
    required this.onEllipsisTap,
  });

  final PostModel postData;
  final VoidCallback onEllipsisTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
      ),
      color: Theme.of(context).appBarTheme.backgroundColor,
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
                          user: {
                            "uid": postData.createUser,
                            "hasAvatar": postData.hasAvatar,
                          },
                          widthSize: Sizes.size60,
                          heightSize: Sizes.size60,
                          borderRadius: Sizes.size30,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
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
                            postData.createUserName,
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
                      Text(postData.content),
                      Gaps.v5,
                      if (postData.type.name == "image" &&
                          postData.imageUrls != null)
                        DynamicImage(
                          imagePaths: [postData.imageUrls!],
                        ),
                      // else if (postData.type == PostType.innerPost &&
                      //     postData.innerPostId != null)
                      //   InnerPost(
                      //     innerPostData: postData.innerPostId!,
                      //   ),
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
                      if (postData.replyCount != 0) Gaps.v10,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gaps.v5,
          // if (postData.likeCount != 0)
          Row(
            children: [
              SizedBox(
                width: Sizes.size60,
                height: Sizes.size50,
                child: postData.likeCount != 0
                    ? DynamicProfile(
                        userImagePaths: postData.likes!,
                      )
                    : const Center(
                        child: SizedBox(
                          width: Sizes.size30,
                          height: Sizes.size30,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user/no_user.jpg"),
                          ),
                        ),
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
          // else

          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: Sizes.size60,
          //       height: Sizes.size50,
          //       child: CircleAvatar(
          //         radius: Sizes.size10,
          //         backgroundImage:
          //             AssetImage(postData.replies![0]["userImagePath"]),
          //       ),
          //     ),
          //     Gaps.h4,
          //     Expanded(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 postData.replyData!.userName,
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: FontSize.fs12,
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   Text(
          //                     '2m',
          //                     style: TextStyle(
          //                       fontSize: FontSize.fs12,
          //                       color: Colors.grey,
          //                     ),
          //                   ),
          //                   Gaps.h10,
          //                   GestureDetector(
          //                     onTap: onEllipsisTap,
          //                     child: FaIcon(
          //                       FontAwesomeIcons.ellipsis,
          //                       size: FontSize.fs12,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           Gaps.v5,
          //           Text(postData.replies!),
          //           Gaps.v10,
          //           Row(
          //             children: [
          //               FaIcon(
          //                 FontAwesomeIcons.heart,
          //                 color: Colors.grey.shade700,
          //                 size: FontSize.fs16,
          //               ),
          //               Gaps.h20,
          //               FaIcon(
          //                 FontAwesomeIcons.message,
          //                 color: Colors.grey.shade700,
          //                 size: FontSize.fs16,
          //               ),
          //               Gaps.h20,
          //               FaIcon(
          //                 FontAwesomeIcons.share,
          //                 color: Colors.grey.shade700,
          //                 size: FontSize.fs16,
          //               ),
          //               Gaps.h20,
          //               FaIcon(
          //                 FontAwesomeIcons.paperPlane,
          //                 color: Colors.grey.shade700,
          //                 size: FontSize.fs16,
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
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
