import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/main_navigation/models/post_model.dart';
import 'package:twitter_challenge/main_navigation/view_models/post_screen_view_model.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/ellipsis_tab.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/post.dart';

import '../../constants/fontsize.dart';
import '../../data/post_data.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const routeName = 'home';
  static const routeURL = '/home';

  const MainScreen({
    super.key,
  });

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  void _onEllipsisTap(String postId) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const EllipsisTab(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(postScreenViewModel).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => const Center(
            child: Text("Error"),
          ),
          data: (postDatas) => CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: Center(
                  child: FaIcon(
                    FontAwesomeIcons.at,
                    size: FontSize.fs30,
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: postDatas.length,
                itemBuilder: (context, index) => Post(
                  key: Key(postDatas[index].postId),
                  postData: postDatas[index],
                  onEllipsisTap: () => _onEllipsisTap(postDatas[index].postId),
                ),
              ),
            ],
          ),
        );
  }
}
