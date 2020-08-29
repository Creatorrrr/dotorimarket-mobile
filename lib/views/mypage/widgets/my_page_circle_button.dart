import 'package:flutter/material.dart';

class MyPageCircleButton extends StatelessWidget {
  static const double RADIUS_DEFAULT = 32.0;

  final double radius;
  final ImageProvider image;
  final String text;
  final Function onPressed;

  MyPageCircleButton({
    Key key,
    this.radius = RADIUS_DEFAULT,
    @required this.image,
    @required this.text,
    @required this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: this.image,
            radius: this.radius,
          ),
          Container(
            child: Text(
              this.text,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            margin: const EdgeInsets.only(
                top: 10.0
            ),
          ),
        ],
      ),
      onPressed: this.onPressed,
    );
  }
}