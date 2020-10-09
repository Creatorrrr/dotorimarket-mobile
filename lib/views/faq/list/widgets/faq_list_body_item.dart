import 'package:flutter/material.dart';

class FaqListBodyItem extends StatelessWidget {
  static const String CONTENT_DEFAULT = '내용 없음';

  final String content;

  FaqListBodyItem({
    Key key,
    this.content = CONTENT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Text(content),
      ),
      alignment: Alignment.topLeft,
    );
  }
}