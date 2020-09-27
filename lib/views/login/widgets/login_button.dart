import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const Color TEXT_COLOR_DEFAULT = Colors.white;
  static const Color BUTTON_COLOR_DEFAULT = ColorConstant.DEEP_YELLOW;
  static const Color BORDER_COLOR_DEFAULT = Colors.white;
  static const double BORDER_RADIUS_DEFAULT = 10.0;
  static const double FONT_SIZE_DEFAULT = 16.0;

  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final double fontSize;
  final double height;
  final double width;
  final double borderRadius;
  final Function onPressed;

  LoginButton({
    Key key,
    @required this.text,
    this.textColor = TEXT_COLOR_DEFAULT,
    this.buttonColor = BUTTON_COLOR_DEFAULT,
    this.borderColor = BORDER_COLOR_DEFAULT,
    this.fontSize = FONT_SIZE_DEFAULT,
    this.height = HEIGHT_DEFAULT,
    this.width = double.infinity,
    this.borderRadius = BORDER_RADIUS_DEFAULT,
    @required this.onPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: FlatButton(
        child: Text(
          this.text,
          style: TextStyle(
            color: this.textColor,
            fontSize: this.fontSize,
          ),
        ),
        color:  this.buttonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: this.borderColor,
          ),
          borderRadius: BorderRadius.circular(this.borderRadius),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}