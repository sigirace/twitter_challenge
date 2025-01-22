import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/signup_form_screen.dart';
import 'package:twitter_challenge/authentication/widgets/auth_button.dart';
import 'package:twitter_challenge/widgets/link_text.dart';

import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          vertical: Height.h32,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: Center(
                child: Text(
                  'See what\'s happening\nin the world right now.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.fs26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Column(
                children: [
                  const AuthButton(
                    text: "Continue with Google",
                    icon: FontAwesomeIcons.google,
                  ),
                  Gaps.v10,
                  const AuthButton(
                    text: "Continue with Apple",
                    icon: FontAwesomeIcons.apple,
                  ),
                  Gaps.v10,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          height: Height.h1,
                        ),
                      ),
                      Gaps.h12,
                      const Text("or"),
                      Gaps.h12,
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          height: Height.h1,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v4,
                  const AuthButton(
                    text: "Create account",
                    backgroundColor: Colors.black,
                    nextWidget: SignupFormScreen(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By signing up, you agree to our ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: "Terms",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: ", ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: "Cookie Use",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Have an account already? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.fs16,
                          ),
                        ),
                        TextSpan(
                            text: "Log in",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: FontSize.fs16,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
