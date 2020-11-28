import 'package:flutter/material.dart';

class HeaderSearchButton extends StatelessWidget {
  static const String SEARCH_ICON_PATH = 'assets/icon/search.png';

  static const double HEIGHT_DEFAULT = 30.0;
  static const double WIDTH_DEFAULT = 200.0;
  static const double BORDER_RADIUS_DEFAULT = 15.0;
  static const double FONT_SIZE_DEFAULT = 16.0;
  static const double SEARCH_ICON_WIDTH = 20.0;
  static const double SEARCH_ICON_LEFT_PADDING = 10.0;
  static const Color BUTTON_COLOR_DEFAULT = Color.fromRGBO(238, 238, 238, 1);

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
    this.buttonColor = BUTTON_COLOR_DEFAULT,
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
      child: InkWell(
        child: Container(
          child: Image.asset(SEARCH_ICON_PATH,
            width: SEARCH_ICON_WIDTH,
          ),
          padding: const EdgeInsets.only(
            left: SEARCH_ICON_LEFT_PADDING,
          ),
          decoration: BoxDecoration(
            color:  buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
      ),
    );
  }
}