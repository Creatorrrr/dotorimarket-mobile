import 'package:flutter/material.dart';

class TabAllBannerImage extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 70.0;

  final double height;
  final String image;

  TabAllBannerImage({
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
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}