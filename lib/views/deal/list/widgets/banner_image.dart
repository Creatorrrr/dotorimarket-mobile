import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  static const double IMAGE_BORDER_RADIUS = 5.0;

  final String image;

  BannerImage({
    Key key,
    @required this.image,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(image,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
    );
  }
}