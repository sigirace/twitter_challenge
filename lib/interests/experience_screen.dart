import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/interests/widgets/experience_widget.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../data/experience.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final List<Map<int, String>> _isSelectedMusicExperiences = [];
  final List<Map<int, String>> _isSelectedEnterExperiences = [];

  void _selectMusicExperience(Map<int, String> interest) {
    setState(() {
      _isSelectedMusicExperiences.add(interest);
    });
  }

  void _unselectMusicExperience(Map<int, String> interest) {
    setState(() {
      _isSelectedMusicExperiences.remove(interest);
    });
  }

  void _selectEnterExperience(Map<int, String> interest) {
    setState(() {
      _isSelectedEnterExperiences.add(interest);
    });
  }

  void _unselectEnterExperience(Map<int, String> interest) {
    setState(() {
      _isSelectedEnterExperiences.remove(interest);
    });
  }

  void _onNext() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          "You have selected",
          style: TextStyle(
            fontSize: FontSize.fs22,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          children: [
            Gaps.v10,
            Text(
              "Music interests",
              style: TextStyle(
                fontSize: FontSize.fs14,
                fontWeight: FontWeight.w500,
              ),
            ),
            for (var musicExperience in _isSelectedMusicExperiences)
              Text(musicExperience.values.join(", ")),
            Gaps.v10,
            Text(
              "Entertainment interests",
              style: TextStyle(
                fontSize: FontSize.fs14,
                fontWeight: FontWeight.w500,
              ),
            ),
            for (var enterExperience in _isSelectedEnterExperiences)
              Text(enterExperience.values.join(", ")),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: FontSize.fs16,
              ),
            ),
          ),
          title: FaIcon(
            FontAwesomeIcons.twitter,
            size: FontSize.fs36,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                    "Interests are used to personalize your experience and will be visible on your profile.",
                    style: TextStyle(
                      fontSize: FontSize.fs13,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Width.w16,
                vertical: Height.h10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Music",
                    style: TextStyle(
                      fontSize: FontSize.fs16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.width / 2,
                      child: Wrap(
                        spacing: Width.w10,
                        runSpacing: Height.h10,
                        children: [
                          for (var musicExperience in musicExperiences)
                            ExperienceWidget(
                              experience: musicExperience,
                              onSelect: _selectMusicExperience,
                              onUnselect: _unselectMusicExperience,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Gaps.v40,
                  Text(
                    "Entertainment",
                    style: TextStyle(
                      fontSize: FontSize.fs16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.width / 2,
                      child: Wrap(
                        spacing: Width.w10,
                        runSpacing: Height.h10,
                        children: [
                          for (var enterExperience in enterExperiences)
                            ExperienceWidget(
                              experience: enterExperience,
                              onSelect: _selectEnterExperience,
                              onUnselect: _unselectEnterExperience,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: _onNext,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Width.w16,
                  vertical: Height.h10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(FontSize.fs60),
                  color: Colors.black,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.fs13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
