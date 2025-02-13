import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/activity/activity_screen.dart';
import 'package:twitter_challenge/main_navigation/main_screen.dart';
import 'package:twitter_challenge/main_navigation/post_screen.dart';
import 'package:twitter_challenge/main_navigation/widgets/nav_tab.dart';
import 'package:twitter_challenge/users/profile_screen.dart';
import 'package:twitter_challenge/search/search_screen.dart';

import '../constants/sizes.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool _isPostScreenOpen = false;

  void _onNavTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostTap() async {
    setState(() {
      _isPostScreenOpen = true;
    });
    await showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => const PostScreen(),
    );
    setState(() {
      _isPostScreenOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _isPostScreenOpen ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: Transform.scale(
              scale: _isPostScreenOpen ? 0.95 : 1,
              child: SafeArea(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size40,
                    ),
                  ),
                  child: const MainScreen(),
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onNavTabTap(0),
            ),
            NavTab(
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onNavTabTap(1),
            ),
            NavTab(
              icon: FontAwesomeIcons.upRightFromSquare,
              isSelected: _selectedIndex == 2,
              onTap: _onPostTap,
            ),
            NavTab(
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onNavTabTap(3),
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onNavTabTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
