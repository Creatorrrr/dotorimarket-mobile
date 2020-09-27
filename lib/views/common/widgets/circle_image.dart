import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final Widget child;
  final ImageProvider image;
  final Color backgroundColor;
  final double radius;
  final BoxBorder border;

  CircleImage({
    Key key,
    this.child,
    this.image,
    this.backgroundColor = ColorConstant.BACKGROUND_GREY,
    @required this.radius,
    this.border,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        image: image != null ? DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ) : null,
        shape: BoxShape.circle,
        border: border,
      ),
    );
  }
}