import 'package:flutter/material.dart';

class NoticeListBodyItem extends StatelessWidget {
  static const String CONTENT_DEFAULT = '내용 없음';

  final String content;

  NoticeListBodyItem({
    Key key,
    this.content = CONTENT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(content),
      alignment: Alignment.topLeft,
    );
  }
}