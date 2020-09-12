import 'package:flutter/material.dart';

class NoticeTitle extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 60.0;

  final String time;
  final String title;
  final double height;

  NoticeTitle({
    Key key,
    @required this.time,
    @required this.title,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              this.time,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}