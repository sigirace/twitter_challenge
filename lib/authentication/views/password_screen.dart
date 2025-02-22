import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/view_models/singup_view_model.dart';
import 'package:twitter_challenge/interests/views/twitter_experience_screen.dart';

import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onNext() {
    if (_isPasswordValid()) {
      final userData = ref.read(signUpForm);
      ref.read(signUpForm.notifier).state =
          userData.copyWith(password: _password);
      ref.read(signUpProvider.notifier).signUp();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TwitterExperienceScreen(),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You'll need a password",
                    style: TextStyle(
                      fontSize: FontSize.fs24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "Make sure it's 8 characters or more.",
                    style: TextStyle(
                      fontSize: FontSize.fs14,
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    controller: _passwordController,
                    cursorColor: Theme.of(context).primaryColor,
                    autocorrect: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: toggleObscureText,
                            child: FaIcon(
                              _obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: FontSize.fs16,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          if (_isPasswordValid())
                            Row(
                              children: [
                                Gaps.h10,
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: FontSize.fs16,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                        ],
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v100,
                  GestureDetector(
                    onTap: () => _onNext(),
                    child: Container(
                      height: Height.h40,
                      decoration: BoxDecoration(
                        color: (_isPasswordValid())
                            ? Colors.black
                            : Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(
                          Width.w64,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: (_isPasswordValid())
                                ? Colors.white
                                : Colors.grey.shade400,
                            fontSize: FontSize.fs20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
