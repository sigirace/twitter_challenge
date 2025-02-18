import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_challenge/search/widgets/search_user.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';
import '../data/search_data.dart';
import '../widgets/custom_divider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = 'search';
  static const routeURL = '/search';

  const SearchScreen({super.key});

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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(Sizes.size40),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
              child: CupertinoSearchTextField(
                placeholder: 'Search',
                autocorrect: false,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: Sizes.size16),
          child: ListView.separated(
            itemCount: userSearchData.length,
            itemBuilder: (context, index) => SearchUser(
              userSearchData: userSearchData[index],
            ),
            separatorBuilder: (context, index) => const CustomDivider(),
          ),
        ),
      ),
    );
  }
}
