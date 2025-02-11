import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/settings/privacy_screen.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leadingWidth: Sizes.size100,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.angleLeft,
                size: Sizes.size24,
              ),
              Gaps.h10,
              Text(
                'Back',
                style: TextStyle(
                  fontSize: FontSize.fs16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
              size: Sizes.size20,
            ),
            title: Text('Follow and invite friends'),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
              size: Sizes.size20,
            ),
            title: Text('Notifications'),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
              size: Sizes.size20,
            ),
            title: const Text('Privacy'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyScreen(),
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.user,
              size: Sizes.size20,
            ),
            title: Text('Account'),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.question,
              size: Sizes.size20,
            ),
            title: Text('Help'),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
              size: Sizes.size20,
            ),
            title: Text('About'),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Log out',
              style: TextStyle(
                fontSize: FontSize.fs14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: const CupertinoActivityIndicator(),
          ),
        ],
      ),
    );
  }
}
