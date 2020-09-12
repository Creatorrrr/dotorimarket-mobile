import 'package:flutter/material.dart';

class NoticeContent extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 60.0;

  final String content;
  final double height;

  NoticeContent({
    Key key,
    @required this.content,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.content),
      alignment: Alignment.centerLeft,
    );
  }
}