import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/search/widgets/search_user.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../data/search_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: Height.h100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: TextStyle(
                fontSize: FontSize.fs28,
              ),
            ),
            Gaps.v10,
            const CupertinoSearchTextField(
              placeholder: 'Search',
              autocorrect: false,
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: userSearchData.length,
        itemBuilder: (context, index) => SearchUser(
          userSearchData: userSearchData[index],
        ),
        separatorBuilder: (context, index) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: Width.w100 + Width.w100 + Width.w100,
              height: Height.h1 / 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
              ),
            ),
            Gaps.v5,
          ],
        ),
      ),
    );
  }
}
