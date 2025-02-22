import 'package:flutter/material.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/dynamic_image.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../schemas/post_schema.dart';

class InnerPost extends StatelessWidget {
  final InnerPostData innerPostData;

  const InnerPost({super.key, required this.innerPostData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.size12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: Sizes.size12,
                backgroundImage: AssetImage(innerPostData.userImagePath),
              ),
              Gaps.h8,
              Text(
                innerPostData.userName,
                style: const TextStyle(
                  fontSize: Sizes.size13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Gaps.v10,
          Text(
            innerPostData.postContent,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Gaps.v10,
          if (innerPostData.postType == InnerPostType.image &&
              innerPostData.imagePaths != null)
            DynamicImage(imagePaths: innerPostData.imagePaths!),
          Gaps.v10,
          Text(
            '${innerPostData.replyCount} replies',
            style: const TextStyle(
              fontSize: Sizes.size13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
