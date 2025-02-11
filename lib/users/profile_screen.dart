import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/data/thread_data.dart';
import 'package:twitter_challenge/main_navigation/widgets/dynamic_profile.dart';
import 'package:twitter_challenge/main_navigation/widgets/post.dart';
import 'package:twitter_challenge/users/widgets/persistent_tab_bar.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../data/reply_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [
              const SliverAppBar(
                pinned: true,
                leading: Center(
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    size: Sizes.size24,
                  ),
                ),
                actions: [
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    size: Sizes.size24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.ellipsis,
                      size: Sizes.size24,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userProfileData.userName,
                                style: const TextStyle(
                                  fontSize: Sizes.size32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.v8,
                              Row(
                                children: [
                                  Text(
                                    userProfileData.fullName,
                                    style: const TextStyle(
                                      fontSize: Sizes.size20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Gaps.h8,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size12,
                                      vertical: Sizes.size4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size16),
                                    ),
                                    child: Text(
                                      'threads.net',
                                      style: TextStyle(
                                        fontSize: Sizes.size12,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.v8,
                              Text(
                                userProfileData.message,
                                style: const TextStyle(
                                  fontSize: Sizes.size16,
                                  color: Colors.black,
                                ),
                              ),
                              Gaps.v12,
                              Row(
                                children: [
                                  DynamicProfile(
                                    userImagePaths:
                                        userProfileData.followerImagePaths!,
                                    leftOffset: 0,
                                    rightOffset: -Sizes.size10,
                                  ),
                                  Text(
                                    '${userProfileData.followerCount} Followers',
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: Sizes.size36,
                            backgroundImage: AssetImage(
                              'assets/images/user/nomard.jpg',
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                border: Border.all(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Gaps.h8,
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                                border: Border.all(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              child: const Text(
                                'Share Profile',
                                style: TextStyle(
                                  fontSize: Sizes.size14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: threadData.length,
                itemBuilder: (context, index) {
                  return Post(
                    key: Key(threadData[index].postId),
                    postData: threadData[index],
                    onEllipsisTap: () => {},
                  );
                },
              ),
              ListView.builder(
                itemCount: replyData.length,
                itemBuilder: (context, index) {
                  return Post(
                    key: Key(replyData[index].postId),
                    postData: replyData[index],
                    onEllipsisTap: () => {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
