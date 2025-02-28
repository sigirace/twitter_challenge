import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/ellipsis_tab.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/post.dart';
import 'package:twitter_challenge/search/view_models/search_post_view_model.dart';
import 'package:twitter_challenge/search/widgets/search_user.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';
import '../data/search_data.dart';
import '../widgets/custom_divider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = 'search';
  static const routeURL = '/search';

  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  bool searchMode = true;

  void _onChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        searchMode = true;
      });
    } else {
      ref.read(searchPostViewModelProvider.notifier).searchPosts(value);
      setState(() {
        searchMode = false;
      });
    }
  }

  void _onEllipsisTap(String postId) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const EllipsisTab(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Search',
              style: TextStyle(
                fontSize: FontSize.fs28,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(Sizes.size40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
              child: CupertinoSearchTextField(
                placeholder: 'Search',
                autocorrect: false,
                onChanged: _onChanged,
              ),
            ),
          ),
        ),
        body: searchMode
            ? Padding(
                padding: const EdgeInsets.only(top: Sizes.size16),
                child: ListView.separated(
                  itemCount: userSearchData.length,
                  itemBuilder: (context, index) => SearchUser(
                    userSearchData: userSearchData[index],
                  ),
                  separatorBuilder: (context, index) => const CustomDivider(),
                ),
              )
            : ref.watch(searchPostViewModelProvider).when(
                  data: (data) => ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Post(
                      key: Key(data[index].postId),
                      postData: data[index],
                      onEllipsisTap: () => _onEllipsisTap(data[index].postId),
                    ),
                    separatorBuilder: (context, index) => const CustomDivider(),
                  ),
                  error: (error, stack) => const SizedBox(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
      ),
    );
  }
}
