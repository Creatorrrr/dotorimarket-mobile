import 'package:flutter/material.dart';

class MyListButton extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 90.0;
  static const int COUNT_DEFAULT = 0;
  static const double COUNT_FONT_SIZE = 20.0;
  static const double TEXT_FONT_SIZE = 14.0;
  static const double TEXT_TOP_MARGIN = 10.0;

  final int count;
  final String text;
  final Function onPressed;
  final double height;

  MyListButton({
    Key key,
    this.count = COUNT_DEFAULT,
    @required this.text,
    @required this.onPressed,
    this.height = HEIGHT_DEFAULT,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text(count.toString(),
                style: const TextStyle(
                  fontSize: COUNT_FONT_SIZE,
                ),
              ),
            ),
            Container(
              child: Text(
                this.text,
                style: TextStyle(
                  fontSize: TEXT_FONT_SIZE,
                ),
              ),
              margin: const EdgeInsets.only(
                  top: TEXT_TOP_MARGIN
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        height: height,
      ),
      onPressed: this.onPressed,
    );
  }
}