import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool isPrivate = true;

  void togglePrivate() {
    setState(() {
      isPrivate = !isPrivate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
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
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.lock,
              size: Sizes.size20,
            ),
            title: const Text('Private profile'),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
              value: isPrivate,
              onChanged: (value) => togglePrivate(),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.at,
              size: Sizes.size20,
            ),
            title: const Text('Mentions'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Everyone',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: FontSize.fs12,
                  ),
                ),
                Gaps.h10,
                const FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bellSlash,
              size: Sizes.size20,
            ),
            title: Text('Muted'),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.eyeSlash,
              size: Sizes.size20,
            ),
            title: Text('Hidden Words'),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.users,
              size: Sizes.size20,
            ),
            title: Text('Profiles you follow'),
            trailing: FaIcon(
              FontAwesomeIcons.angleRight,
              size: Sizes.size20,
            ),
          ),
          const Divider(
            height: Sizes.size8,
          ),
          ListTile(
            title: Text(
              'Other privacy settings',
              style: TextStyle(
                fontSize: FontSize.fs14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
              style: TextStyle(
                fontSize: FontSize.fs12,
                color: Colors.grey.shade600,
              ),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.clipboard,
              size: Sizes.size20,
            ),
            isThreeLine: true,
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userSlash,
              size: Sizes.size20,
            ),
            title: Text('Blocked profiles'),
            trailing: FaIcon(
              FontAwesomeIcons.clipboard,
              size: Sizes.size20,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCircleXmark,
              size: Sizes.size20,
            ),
            title: Text('Hide likes'),
            trailing: FaIcon(
              FontAwesomeIcons.clipboard,
              size: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}
