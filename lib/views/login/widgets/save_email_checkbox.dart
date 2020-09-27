import 'package:flutter/material.dart';

class SaveEmailCheckbox extends StatelessWidget {
  static const double TITLE_FONT_SIZE = 16.0;

  final String title;
  final bool value;
  final Function(bool) onChanged;

  SaveEmailCheckbox({
    this.title,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Text(title,
            style: const TextStyle(
              fontSize: TITLE_FONT_SIZE,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}