import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {

  final String image;

  MainImage({
    Key key,
    @required this.image,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      child: Image.asset(
        this.image,
        fit: BoxFit.cover,
      ),
      aspectRatio: 1.0,
    );
  }
}