import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_challenge/authentication/view_models/login_view_model.dart';
import 'package:twitter_challenge/authentication/views/signup_screen.dart';
import 'package:twitter_challenge/constants/gaps.dart';

import '../../constants/sizes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = 'login';
  static const routeURL = '/login';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    ref.read(loginProvider.notifier).login(
          _emailController.text,
          _passwordController.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          'English (US)',
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              size: Sizes.size80,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _emailController,
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: Sizes.size20,
                              horizontal: Sizes.size16,
                            ),
                            hintText: 'Mobile number or email',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size4),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v12,
                        TextField(
                          controller: _passwordController,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: Sizes.size20,
                              horizontal: Sizes.size16,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size4),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Sizes.size4),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v12,
                        GestureDetector(
                          onTap: _onLogin,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                            ),
                            decoration: BoxDecoration(
                              color: ref.watch(loginProvider).isLoading
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: ref.watch(loginProvider).isLoading
                                ? const SizedBox(
                                    width: Sizes.size20,
                                    height: Sizes.size20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: Sizes.size2,
                                    ),
                                  )
                                : const Text(
                                    "Log in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(Sizes.size4),
                          ),
                          child: GestureDetector(
                            onTap: () => context.go(SignupScreen.routeURL),
                            child: const Text(
                              'Create new account',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v12,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.meta,
                              color: Colors.grey.shade700,
                              size: Sizes.size16,
                            ),
                            Gaps.h4,
                            Text(
                              'Meta',
                              style: TextStyle(
                                color: Colors.grey.shade700,
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
          ),
        ),
      ),
    );
  }
}
