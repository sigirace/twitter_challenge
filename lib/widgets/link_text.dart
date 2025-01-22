import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class LinkTextItem {
  String text;
  bool isLink;

  Function()? onTap;

  LinkTextItem({
    required this.text,
    this.isLink = false,
    this.onTap,
  });
}

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.items,
  });

  final List<LinkTextItem> items;

  @override
  Widget build(BuildContext context) {
    TextStyle mainTextStyle = const TextStyle(
      color: Colors.black87,
      fontSize: Sizes.size18,
      fontWeight: FontWeight.w500,
    );

    TextStyle linkTextStyle = mainTextStyle.copyWith(
      color: Theme.of(context).primaryColor,
    );

    TextSpan getTextSpan(LinkTextItem item) {
      if (item.isLink) {
        return TextSpan(
          text: item.text,
          style: linkTextStyle,
          recognizer: TapGestureRecognizer()..onTap = item.onTap,
        );
      } else {
        return TextSpan(
          text: item.text,
          style: mainTextStyle,
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              for (int i = 0; i < items.length; i++) getTextSpan(items[i]),
            ],
          ),
        ),
      ],
    );
  }
}
