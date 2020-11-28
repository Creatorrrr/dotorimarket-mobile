import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  static const double IMAGE_BORDER_RADIUS = 5.0;

  final String image;
  final void Function() onPressed;

  BannerImage({
    Key key,
    @required this.image,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        child: Image.asset(image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
      ),
      onTap: onPressed,
    );
  }
}