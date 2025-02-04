import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/main_navigation/widgets/post.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';
import '../data/post_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: FaIcon(
              FontAwesomeIcons.at,
              size: FontSize.fs30,
            ),
          ),
          SliverList.builder(
            itemCount: postData.length,
            itemBuilder: (context, index) => Post(postData: postData[index]),
          ),
        ],
      ),
    );
  }
}
