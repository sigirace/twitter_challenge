import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/main_navigation/widgets/ellipsis_tab.dart';
import 'package:twitter_challenge/main_navigation/widgets/post.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';
import '../data/post_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onEllipsisTap(String postId) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const EllipsisTab(),
    );
  }

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
            itemBuilder: (context, index) => Post(
              key: Key(postData[index].postId),
              postData: postData[index],
              onEllipsisTap: () => _onEllipsisTap(postData[index].postId),
            ),
          ),
        ],
      ),
    );
  }
}
