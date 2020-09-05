import 'package:flutter/material.dart';

class FindButton extends StatelessWidget {
  static const double FONT_SIZE_DEFAULT = 16.0;

  final String text;
  final double fontSize;
  final Function onPressed;

  FindButton({
    Key key,
    @required this.text,
    this.fontSize = FONT_SIZE_DEFAULT,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: this.fontSize,
        ),
      ),
      onTap: this.onPressed,
    );
  }
}