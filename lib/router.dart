import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/activity/activity_screen.dart';
import 'package:twitter_challenge/main_navigation/main_navigation_screen.dart';
import 'package:twitter_challenge/main_navigation/main_screen.dart';
import 'package:twitter_challenge/search/search_screen.dart';
import 'package:twitter_challenge/settings/views/privacy_screen.dart';
import 'package:twitter_challenge/settings/views/setting_screen.dart';
import 'package:twitter_challenge/users/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routerNeglect: false,
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
          child: MainNavigationScreen(child: child),
        );
      },
      routes: [
        GoRoute(
          path: MainScreen.routeURL,
          name: MainScreen.routeName,
          builder: (context, state) => const MainScreen(),
        ),
        GoRoute(
          path: SearchScreen.routeURL,
          name: SearchScreen.routeName,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: ActivityScreen.routeURL,
          name: ActivityScreen.routeName,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: ProfileScreen.routeURL,
          name: ProfileScreen.routeName,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: SettingScreen.routeURL,
      name: SettingScreen.routeName,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SettingScreen(),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeURL,
          name: PrivacyScreen.routeName,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
