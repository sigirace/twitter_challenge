import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_challenge/authentication/password_screen.dart';
import 'package:twitter_challenge/authentication/signup_screen.dart';
import 'package:twitter_challenge/authentication/social_auth_screen.dart';

import 'constants/fontsize.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

final Map<String, dynamic> userData = {
  "name": "John Doe",
  "email": "john.doe@example.com",
  "birthday": "1990-01-01",
  "isTracking": true,
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'Twitter Challenge',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size20,
                color: Colors.black,
              ),
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              elevation: 0,
              color: Colors.white,
            ),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.black54,
                fontSize: FontSize.fs16,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: FontSize.fs20,
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
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xFF4E98E9),
            ),
            primaryColor: const Color(0xFF4E98E9),
            useMaterial3: true,
          ),
          home: const PasswordScreen(),
        );
      },
    );
  }
}
