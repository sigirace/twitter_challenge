import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Widget? nextWidget;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.nextWidget,
  });

  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextWidget!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextWidget != null ? () => _onTap(context) : null,
      child: FractionallySizedBox(
        child: Container(
          padding: const EdgeInsets.all(
            Sizes.size16,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                Sizes.size30,
              ),
            ),
            border: backgroundColor == null
                ? Border.all(
                    color: Colors.grey.shade300,
                    width: Sizes.size1,
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? FaIcon(
                      icon,
                      size: Sizes.size29,
                    )
                  : const SizedBox.shrink(),
              Gaps.h16,
              Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                  color: backgroundColor == null ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
