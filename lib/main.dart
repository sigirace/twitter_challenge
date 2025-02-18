import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_challenge/main_navigation/main_navigation_screen.dart';
import 'package:twitter_challenge/router.dart';

import 'constants/fontsize.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Twitter Challenge',
          themeMode: ThemeMode.system,
          theme: ThemeData(
            brightness: Brightness.light,
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
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
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
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(
              surfaceTintColor: Colors.black,
              backgroundColor: Colors.black,
              foregroundColor: Colors.grey.shade400,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size20,
                color: Colors.grey.shade400,
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.black,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              elevation: 0,
              color: Colors.black,
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
        );
      },
    );
  }
}
