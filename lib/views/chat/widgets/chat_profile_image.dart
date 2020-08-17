import 'package:flutter/material.dart';

class ChatProfileImage extends StatelessWidget {
  static const double RADIUS_DEFAULT = 20.0;

  final double radius;
  final ImageProvider image;

  ChatProfileImage({
    Key key,
    this.radius = RADIUS_DEFAULT,
    @required this.image,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: this.image,
      radius: this.radius,
    );
  }
}