import 'package:flutter/material.dart';

class DealBottomButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const Color BACKGROUND_COLOR_DEFAULT = Color.fromRGBO(250, 187, 65, 1.0);
  static const Color FONT_COLOR_DEFAULT = Colors.white;
  static const double FONT_SIZE_DEFAULT = 18.0;

  final String text;
  final double height;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  final Function onPressed;

  DealBottomButton({
    Key key,
    @required this.text,
    this.height = HEIGHT_DEFAULT,
    this.backgroundColor = BACKGROUND_COLOR_DEFAULT,
    this.fontColor = FONT_COLOR_DEFAULT,
    this.fontSize = FONT_SIZE_DEFAULT,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(text,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
        color: backgroundColor,
        onPressed: onPressed,
    );
  }
}