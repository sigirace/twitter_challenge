import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_challenge/authentication/customize_screen.dart';
import 'package:twitter_challenge/utils/date_utils.dart';
import 'package:twitter_challenge/utils/validator.dart';
import '../constants/fontsize.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isNameValid = false;
  final FocusNode _nameFocusNode = FocusNode();

  bool _isEmailValid = false;
  final FocusNode _emailFocusNode = FocusNode();

  DateTime? _selectedBirthday;
  bool _isBirthdayValid = false;
  final _birthdayController = TextEditingController();
  final FocusNode _birthdayFocusNode = FocusNode();

  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _birthdayController.dispose();
    _emailFocusNode.dispose();
    _birthdayFocusNode.dispose();
    super.dispose();
  }

  bool _validate() {
    if (_isNameValid && _isEmailValid && _isBirthdayValid) {
      return true;
    }
    return false;
  }

  void _onTap(FocusNode focusNode) {
    FocusScope.of(context).unfocus();
    setState(() {
      focusNode.requestFocus();
    });
  }

  void _onNext() {
    if (!_validate()) {
      return;
    }

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    } else {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomizeScreen(
          userData: userData,
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
          leadingWidth: Width.w72,
          leading: GestureDetector(
            // onTap: () => Navigator.pop(context),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: Width.w12,
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: FontSize.fs16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Name
                          TextFormField(
                            autocorrect: false,
                            decoration: InputDecoration(
                              labelText: "Name",
                              suffixIcon: _isNameValid
                                  ? const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.circleCheck,
                                          color: Colors.green,
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: FontSize.fs16,
                            ),
                            validator: (value) => validateName(value),
                            onChanged: (value) => {
                              validateName(value) == null
                                  ? setState(
                                      () {
                                        _isNameValid = true;
                                      },
                                    )
                                  : setState(
                                      () {
                                        _isNameValid = false;
                                      },
                                    ),
                            },
                            onTap: () => _onTap(_nameFocusNode),
                            onSaved: (value) => userData["name"] = value!,
                          ),
                          Gaps.v10,
                          // Email
                          TextFormField(
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              labelText: "Email",
                              suffixIcon: _isEmailValid
                                  ? const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.circleCheck,
                                          color: Colors.green,
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: FontSize.fs16,
                            ),
                            validator: (value) => validateEmail(value),
                            onChanged: (value) => {
                              validateEmail(value) == null
                                  ? setState(
                                      () {
                                        _isEmailValid = true;
                                      },
                                    )
                                  : setState(
                                      () {
                                        _isEmailValid = false;
                                      },
                                    ),
                            },
                            onTap: () => _onTap(_emailFocusNode),
                            onSaved: (value) => userData["email"] = value!,
                          ),
                          Gaps.v10,

                          TextFormField(
                            autocorrect: false,
                            focusNode: _birthdayFocusNode,
                            controller: _birthdayController,
                            decoration: InputDecoration(
                              labelText: "Birthday",
                              suffixIcon: _isBirthdayValid
                                  ? const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.circleCheck,
                                          color: Colors.green,
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: FontSize.fs16,
                            ),
                            readOnly: true,
                            onTap: () => _onTap(_birthdayFocusNode),
                            onSaved: (value) => userData["birthday"] = value!,
                          ),
                          if (_birthdayFocusNode.hasFocus)
                            Column(
                              children: [
                                Gaps.v5,
                                const Text(
                                  "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _emailFocusNode.hasFocus
                            ? Text(
                                "Use phone instead",
                                style: TextStyle(
                                  fontSize: FontSize.fs14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const SizedBox.shrink(),
                        GestureDetector(
                          onTap: _onNext,
                          child: Container(
                            width: Width.w80,
                            height: Height.h36,
                            decoration: BoxDecoration(
                              color: _validate()
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
                                  color: _validate()
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                  fontSize: FontSize.fs18,
                                  fontWeight: FontWeight.w600,
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
            ],
          ),
        ),
        bottomNavigationBar: _birthdayFocusNode.hasFocus
            ? BottomAppBar(
                height: Height.h100 + Height.h28,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      _selectedBirthday = date;
                      _birthdayController.text = formatDate(date);
                      _isBirthdayValid = true;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }
}
