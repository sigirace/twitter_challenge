import 'package:flutter/material.dart';

import '../constants/fontsize.dart';
import '../constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: FontSize.fs28,
            ),
          ),
        ),
      ),
    );
  }
}
