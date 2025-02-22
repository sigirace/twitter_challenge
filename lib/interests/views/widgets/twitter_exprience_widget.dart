import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/fontsize.dart';
import '../../../constants/sizes.dart';

class TwitterExperienceWidget extends StatefulWidget {
  const TwitterExperienceWidget({
    super.key,
    required this.interest,
    required this.onSelect,
    required this.onUnselect,
  });

  final Map<int, String> interest;
  final Function(Map<int, String>) onSelect;
  final Function(Map<int, String>) onUnselect;
  @override
  State<TwitterExperienceWidget> createState() =>
      _TwitterExperienceWidgetState();
}

class _TwitterExperienceWidgetState extends State<TwitterExperienceWidget> {
  bool isSelected = false;

  void toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
    if (isSelected) {
      widget.onSelect(widget.interest);
    } else {
      widget.onUnselect(widget.interest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleSelected(),
      child: FractionallySizedBox(
        widthFactor: 0.48,
        child: Container(
          height: Height.h70,
          padding: EdgeInsets.symmetric(
            horizontal: Width.w10,
            vertical: Height.h10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
            ),
          ),
          child: Stack(
            children: [
              if (isSelected)
                Align(
                  alignment: Alignment.topRight,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: isSelected ? Colors.white : Colors.black,
                    size: FontSize.fs13,
                  ),
                ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.interest.values.first,
                  style: TextStyle(
                    fontSize: FontSize.fs13,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
