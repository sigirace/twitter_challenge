import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/data/thread_data.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/dynamic_profile.dart';
import 'package:twitter_challenge/main_navigation/views/widgets/post.dart';
import 'package:twitter_challenge/settings/views/setting_screen.dart';
import 'package:twitter_challenge/users/view_models/user_view_model.dart';
import 'package:twitter_challenge/users/views/widgets/avatar.dart';
import 'package:twitter_challenge/users/views/widgets/persistent_tab_bar.dart';
import 'package:twitter_challenge/utils/mode.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../data/reply_data.dart';

class ProfileScreen extends ConsumerWidget {
  static const routeName = 'profile';
  static const routeURL = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userProvider).when(
          error: (error, stack) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (userProfile) => SafeArea(
            child: DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      leading: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.globe,
                          size: Sizes.size24,
                        ),
                      ),
                      actions: [
                        const FaIcon(
                          FontAwesomeIcons.instagram,
                          size: Sizes.size24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size16,
                          ),
                          child: GestureDetector(
                            onTap: () => context.push(SettingScreen.routeURL),
                            child: const FaIcon(
                              FontAwesomeIcons.ellipsis,
                              size: Sizes.size24,
                            ),
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
                                      userProfile.name,
                                      style: TextStyle(
                                        fontSize: Sizes.size32,
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode(context)
                                            ? Colors.grey.shade400
                                            : Colors.black,
                                      ),
                                    ),
                                    Gaps.v8,
                                    Row(
                                      children: [
                                        Text(
                                          userProfile.name,
                                          style: TextStyle(
                                            fontSize: Sizes.size20,
                                            color: isDarkMode(context)
                                                ? Colors.grey.shade400
                                                : Colors.black,
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
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size16,
                                            ),
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
                                      style: TextStyle(
                                        fontSize: Sizes.size16,
                                        color: isDarkMode(context)
                                            ? Colors.grey.shade400
                                            : Colors.black,
                                      ),
                                    ),
                                    Gaps.v12,
                                    Row(
                                      children: [
                                        DynamicProfile(
                                          userImagePaths:
                                              userProfile.followers ?? [],
                                          leftOffset: 0,
                                          rightOffset: -Sizes.size10,
                                        ),
                                        if (userProfile.followers?.length == 1)
                                          Gaps.h10,
                                        Text(
                                          '${userProfile.followerCount} Followers',
                                          style: TextStyle(
                                            fontSize: Sizes.size14,
                                            fontWeight: FontWeight.w600,
                                            color: isDarkMode(context)
                                                ? Colors.grey.shade400
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Avatar(
                                  hasAvatar: userProfile.hasAvatar,
                                  uid: userProfile.uid,
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
                body: const TabBarView(
                  children: [
                    Text("Threads"),
                    Text("Replies"),
                  ],
                ),
                // body: TabBarView(
                //   children: [
                //     ListView.builder(
                //       itemCount: threadData.length,
                //       itemBuilder: (context, index) {
                //         return Post(
                //           key: Key(threadData[index].postId),
                //           postData: threadData[index],
                //           onEllipsisTap: () => {},
                //         );
                //       },
                //     ),
                //     ListView.builder(
                //       itemCount: replyData.length,
                //       itemBuilder: (context, index) {
                //         return Post(
                //           key: Key(replyData[index].postId),
                //           postData: replyData[index],
                //           onEllipsisTap: () => {},
                //         );
                //       },
                //     ),
                //   ],
                // ),
              ),
            ),
          ),
        );
  }
}
