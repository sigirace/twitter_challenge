import 'package:flutter/material.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: Width.w100 + Width.w100 + Width.w100,
          height: Height.h1 / 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
          ),
        ),
        Gaps.v5,
      ],
    );
  }
}
