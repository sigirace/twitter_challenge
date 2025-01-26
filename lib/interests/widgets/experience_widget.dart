import 'package:flutter/material.dart';

import '../../constants/fontsize.dart';
import '../../constants/sizes.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({
    super.key,
    required this.experience,
    required this.onSelect,
    required this.onUnselect,
  });

  final Map<int, String> experience;

  final Function(Map<int, String>) onSelect;
  final Function(Map<int, String>) onUnselect;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  bool isSelected = false;

  void _onTap() {
    setState(() {
      isSelected = !isSelected;
    });
    if (isSelected) {
      widget.onSelect(widget.experience);
    } else {
      widget.onUnselect(widget.experience);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Width.w10,
          vertical: Height.h8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FontSize.fs30),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade400,
          ),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Text(
          widget.experience.values.first,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
