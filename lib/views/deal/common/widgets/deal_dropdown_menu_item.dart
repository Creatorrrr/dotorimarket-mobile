import 'package:flutter/material.dart';

class DealDropdownMenuItem<T> extends StatelessWidget {
  static const double FONT_SIZE_DEFAULT = 16.0;

  final String text;
  final double fontSize;
  final T value;

  DealDropdownMenuItem({
    Key key,
    @required this.text,
    this.fontSize = FONT_SIZE_DEFAULT,
    this.value,
  }):super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}