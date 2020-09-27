import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageTextButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double FONT_SIZE_DEFAULT = 16.0;

  final String text;
  final void Function() onPressed;
  final double height;
  final double fontSize;

  MyPageTextButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.height = HEIGHT_DEFAULT,
    this.fontSize = FONT_SIZE_DEFAULT,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: height,
      ),
      onPressed: this.onPressed,
    );
  }
}