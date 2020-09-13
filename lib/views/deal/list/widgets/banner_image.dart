import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 70.0;
  static const double IMAGE_BORDER_RADIUS = 5.0;

  final double height;
  final String image;

  BannerImage({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.image,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        this.image,
        height: this.height,
      ),
      borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
    );
  }
}