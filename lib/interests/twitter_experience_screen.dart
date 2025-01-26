import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/interests/experience_screen.dart';
import 'package:twitter_challenge/interests/widgets/twitter_exprience_widget.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../data/twitter_expereince.dart';

class TwitterExperienceScreen extends StatefulWidget {
  const TwitterExperienceScreen({super.key});

  @override
  State<TwitterExperienceScreen> createState() =>
      _TwitterExperienceScreenState();
}

class _TwitterExperienceScreenState extends State<TwitterExperienceScreen> {
  final List<Map<int, String>> _selectedInterests = [];

  void _selectInterest(Map<int, String> interest) {
    setState(() {
      _selectedInterests.add(interest);
    });
  }

  void _unselectInterest(Map<int, String> interest) {
    setState(() {
      _selectedInterests.remove(interest);
    });
  }

  void _onNext() {
    if (_selectedInterests.length >= 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExperienceScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: FaIcon(
            FontAwesomeIcons.twitter,
            size: FontSize.fs36,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Width.w32,
            vertical: Height.h20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: FontSize.fs22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(
                  fontSize: FontSize.fs14,
                  color: Colors.grey.shade800,
                ),
              ),
              Gaps.v30,
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: Width.w10,
                    runSpacing: Height.h10,
                    children: [
                      for (var interest in twitterInterests)
                        TwitterExperienceWidget(
                          interest: interest,
                          onSelect: _selectInterest,
                          onUnselect: _unselectInterest,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Width.w20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _selectedInterests.length < 3
                    ? Text(
                        "${_selectedInterests.length} of 3 selected",
                        style: TextStyle(
                          fontSize: FontSize.fs13,
                        ),
                      )
                    : Text(
                        "Great Work 🎉",
                        style: TextStyle(
                          fontSize: FontSize.fs13,
                        ),
                      ),
                Gaps.h10,
                GestureDetector(
                  onTap: () => _onNext(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Width.w16,
                      vertical: Height.h8,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedInterests.length >= 3
                          ? Colors.black
                          : Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(FontSize.fs20),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: _selectedInterests.length >= 3
                            ? Colors.white
                            : Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
