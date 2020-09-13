import 'package:flutter/material.dart';

class HeaderTitleText extends StatelessWidget {
  static const double HEADER_TEXT_SIZE = 16.0;

  final String text;

  HeaderTitleText(this.text, {
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: HEADER_TEXT_SIZE,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}