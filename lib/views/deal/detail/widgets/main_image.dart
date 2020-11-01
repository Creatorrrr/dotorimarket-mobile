import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {

  final Image image;

  MainImage({
    Key key,
    @required this.image,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      child: image,
      aspectRatio: 1.0,
    );
  }
}