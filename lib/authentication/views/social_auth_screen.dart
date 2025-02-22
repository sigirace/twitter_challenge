import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/views/password_screen.dart';
import 'package:twitter_challenge/authentication/view_models/singup_view_model.dart';

import '../../constants/fontsize.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class SocialAuthScreen extends ConsumerStatefulWidget {
  const SocialAuthScreen({
    super.key,
  });

  @override
  ConsumerState<SocialAuthScreen> createState() => _SocialAuthScreenState();
}

class _SocialAuthScreenState extends ConsumerState<SocialAuthScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isAllFieldsFilled = false;
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      setState(() {
        _isAllFieldsFilled = true;
        FocusScope.of(context).unfocus();
      });
    } else {
      setState(() {
        _isAllFieldsFilled = false;
      });
    }
  }

  void _onNext() {
    if (_isAllFieldsFilled) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PasswordScreen(),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We sent you a code",
                    style: TextStyle(
                      fontSize: FontSize.fs28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Enter it below to verify\n${ref.read(signUpForm).email}.",
                    style: TextStyle(
                      fontSize: FontSize.fs16,
                    ),
                  ),
                  Gaps.v20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) {
                        return SizedBox(
                          width: Width.w40,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: TextStyle(
                              fontSize: FontSize.fs24,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              counterText: "",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            onChanged: (value) => _onChanged(value, index),
                          ),
                        );
                      },
                    ),
                  ),
                  Gaps.v20,
                  if (_isAllFieldsFilled)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.green,
                          size: FontSize.fs36,
                        ),
                      ],
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Didn't receive email?",
                    style: TextStyle(
                      fontSize: FontSize.fs16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.v10,
                  GestureDetector(
                    onTap: () => _onNext(),
                    child: Container(
                      height: Height.h40,
                      decoration: BoxDecoration(
                        color: _isAllFieldsFilled
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
                            color: _isAllFieldsFilled
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
