import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/social_auth_screen.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SignupConfirmScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  const SignupConfirmScreen({
    super.key,
    required this.userData,
  });

  bool _validateUserData() {
    if (userData["name"] == null ||
        userData["email"] == null ||
        userData["birthday"] == null ||
        userData["isTracking"] != true) {
      return false;
    }
    return true;
  }

  void _showCongratulationsDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Congratulations!"),
          content: const Text(
              "You have successfully completed the signup. You can now register your desired experiences after verifying your email.",),
          actions: [
            CupertinoDialogAction(
              child: const Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocialAuthScreen(userData: userData),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _onSignUp(BuildContext context) {
    if (_validateUserData()) {
      _showCongratulationsDialog(context);
    }
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Width.w32,
            vertical: Height.h20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: FontSize.fs28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v20,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Name
                        TextFormField(
                          autocorrect: false,
                          initialValue: userData["name"],
                          decoration: const InputDecoration(
                              labelText: "Name",
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  ),
                                ],
                              ),),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        Gaps.v10,
                        // Email
                        TextFormField(
                          autocorrect: false,
                          initialValue: userData["email"],
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  ),
                                ],
                              ),),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        Gaps.v10,

                        TextFormField(
                          autocorrect: false,
                          initialValue: userData["birthday"],
                          decoration: const InputDecoration(
                              labelText: "Birthday",
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Colors.green,
                                  ),
                                ],
                              ),),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: FontSize.fs16,
                          ),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                          " Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
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
                    TextSpan(
                      text:
                          ". Others will be albe to find you by email or phone number, when provided, unless you choose otherwise ",
                      style: TextStyle(
                        fontSize: FontSize.fs12,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    TextSpan(
                      text: "here",
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
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () => _onSignUp(context),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: Height.h50,
              left: Width.w32,
              right: Width.w32,
            ),
            child: Container(
              height: Height.h40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Width.w64,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.fs18,
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
