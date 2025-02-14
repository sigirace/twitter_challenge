import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/constants/sizes.dart';

class PostImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback callback;
  const PostImage({
    super.key,
    required this.imagePath,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size20,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.file(
            File(imagePath),
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            alignment: Alignment.center,
            height: Sizes.size30,
            width: Sizes.size30,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: callback,
              child: const FaIcon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
