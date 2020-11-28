import 'package:flutter/material.dart';

class MenuItemButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double FONT_SIZE_DEFAULT = 9.0;
  static const double ICON_FONT_DISTANCE_DEFAULT = 5.0;

  final double height;
  final Widget icon;
  final String name;
  final double fontSize;
  final double iconFontDistance;
  final Function onPressed;

  MenuItemButton({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.icon,
    @required this.name,
    this.fontSize = FONT_SIZE_DEFAULT,
    this.iconFontDistance = ICON_FONT_DISTANCE_DEFAULT,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: icon,
            ),
            Container(
              child: Text(
                this.name,
                style: TextStyle(
                  fontSize: this.fontSize,
                ),
              ),
              padding: EdgeInsets.only(
                top: this.iconFontDistance,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      onTap: this.onPressed,
    );
  }
}