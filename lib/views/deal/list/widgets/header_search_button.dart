import 'package:flutter/material.dart';

class HeaderSearchButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 30.0;
  static const double WIDTH_DEFAULT = 200.0;
  static const double BORDER_RADIUS_DEFAULT = 15.0;
  static const double FONT_SIZE_DEFAULT = 16.0;

  final Color iconColor;
  final Color buttonColor;
  final double fontSize;
  final double height;
  final double width;
  final double borderRadius;
  final Function onPressed;

  HeaderSearchButton({
    Key key,
    this.iconColor = Colors.black,
    this.buttonColor = Colors.black12,
    this.fontSize = FONT_SIZE_DEFAULT,
    this.height = HEIGHT_DEFAULT,
    this.width = double.infinity,
    this.borderRadius = BORDER_RADIUS_DEFAULT,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: FlatButton(
        child: Container(
          child: Icon(Icons.search,
            color: iconColor,
          ),
          alignment: Alignment.centerLeft,
        ),
        color:  buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}