import 'package:flutter/material.dart';

class HeaderIconButton extends StatelessWidget {
  static const double WIDTH_DEFAULT = 30.0;
  static const double ICON_SIZE_DEFAULT = 24.0;

  final double width;
  final double iconSize;
  final Icon icon;
  final Function onPressed;

  HeaderIconButton({
    Key key,
    this.iconSize = ICON_SIZE_DEFAULT,
    this.width = WIDTH_DEFAULT,
    @required this.icon,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        icon: this.icon,
        iconSize: this.iconSize,
        color: Colors.black,
        alignment: Alignment.center,
        onPressed: this.onPressed,
      ),
      width: this.width,
    );
  }
}