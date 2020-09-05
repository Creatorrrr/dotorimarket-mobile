import 'package:flutter/material.dart';

class SaveEmailCheckbox extends StatelessWidget {
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
   return CheckboxListTile(
     title: Text(this.title),
     value: this.value,
     controlAffinity: ListTileControlAffinity.leading,
     onChanged: this.onChanged,
   );
  }
}