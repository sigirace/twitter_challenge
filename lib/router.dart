import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/activity/activity_screen.dart';
import 'package:twitter_challenge/authentication/repos/authentication_repo.dart';
import 'package:twitter_challenge/authentication/views/login_screen.dart';
import 'package:twitter_challenge/authentication/views/signup_screen.dart';
import 'package:twitter_challenge/main_navigation/views/main_navigation_screen.dart';
import 'package:twitter_challenge/main_navigation/views/main_screen.dart';
import 'package:twitter_challenge/search/search_screen.dart';
import 'package:twitter_challenge/settings/views/privacy_screen.dart';
import 'package:twitter_challenge/settings/views/setting_screen.dart';
import 'package:twitter_challenge/users/views/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (state.subloc != SignupScreen.routeURL &&
          state.subloc != LoginScreen.routeURL &&
          !isLoggedIn) {
        return SignupScreen.routeURL;
      }
      return null;
    },
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: SignupScreen.routeURL,
        name: SignupScreen.routeName,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeURL,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
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
});
