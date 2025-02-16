import 'package:flutter/material.dart';
import 'package:twitter_challenge/utils/mode.dart';

import '../../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDarkMode(context)
                ? Colors.grey.shade400
                : Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor:
            isDarkMode(context) ? Colors.grey.shade400 : Colors.black,
        labelPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        labelColor: isDarkMode(context) ? Colors.grey.shade400 : Colors.black,
        tabs: const [
          Tab(text: 'Threads'),
          Tab(text: 'Replies'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
