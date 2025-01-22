import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/signup_confirm_screen.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class CustomizeScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const CustomizeScreen({
    super.key,
    required this.userData,
  });

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool _isSwitchOn = false;

  void _onNext() {
    if (_isSwitchOn) {
      widget.userData["isTracking"] = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupConfirmScreen(
            userData: widget.userData,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Width.w32,
          vertical: Height.h20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: FontSize.fs28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v10,
            Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: FontSize.fs18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      fontSize: FontSize.fs14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Switch(
                  value: _isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwitchOn = value;
                    });
                  },
                  activeTrackColor: Colors.green,
                ),
              ],
            ),
            Gaps.v14,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextSpan(
                    text: "Terms",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ",",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ", and ",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextSpan(
                    text: "Cookie Use",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      fontSize: FontSize.fs12,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => _onNext(),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: Height.h50,
            left: Width.w32,
            right: Width.w32,
          ),
          child: Container(
            height: Height.h40,
            decoration: BoxDecoration(
              color: _isSwitchOn ? Colors.black : Colors.grey.shade600,
              borderRadius: BorderRadius.circular(
                Width.w64,
              ),
            ),
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  color: _isSwitchOn ? Colors.white : Colors.grey.shade400,
                  fontSize: FontSize.fs18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
