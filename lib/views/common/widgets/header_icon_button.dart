import 'package:flutter/material.dart';

class HeaderIconButton extends StatelessWidget {
  static const double WIDTH_DEFAULT = 50.0;
  static const double PADDING_SIZE_DEFAULT = 8.0;
  static const double ICON_SIZE_DEFAULT = 24.0;

  final double width;
  final double iconSize;
  final double paddingSize;
  final Widget icon;
  final Function onPressed;

  HeaderIconButton({
    Key key,
    this.iconSize = ICON_SIZE_DEFAULT,
    this.width = WIDTH_DEFAULT,
    this.paddingSize = PADDING_SIZE_DEFAULT,
    @required this.icon,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        icon: this.icon,
        iconSize: this.iconSize,
        padding: EdgeInsets.all(paddingSize),
        color: Colors.black,
        alignment: Alignment.center,
        onPressed: this.onPressed,
      ),
      width: width,
    );
  }
}