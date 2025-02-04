import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/main_navigation/main_screen.dart';
import 'package:twitter_challenge/main_navigation/not_imple.dart';
import 'package:twitter_challenge/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onNavTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const SafeArea(
              child: MainScreen(),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const NotImplementedScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const NotImplementedScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const NotImplementedScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const NotImplementedScreen(),
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
              onTap: () => _onNavTabTap(2),
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
