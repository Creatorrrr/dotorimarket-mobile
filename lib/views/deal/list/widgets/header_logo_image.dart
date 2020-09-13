import 'package:flutter/material.dart';

class HeaderLogoImage extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 30.0;
  static const double WIDTH_DEFAULT = 30.0;

  final double height;
  final double width;
  final String image;

  HeaderLogoImage({
    Key key,
    this.height = HEIGHT_DEFAULT,
    this.width = WIDTH_DEFAULT,
    @required this.image,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      this.image,
      height: this.height,
      width: this.width,
    );
  }
}