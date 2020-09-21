import 'package:dotorimarket/views/chat/content/widgets/header_title.dart';
import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/common/widgets/header_title_text.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TITLE_LEFT_PADDING = 15.0;
  static const double HEADER_BOTTOM_BORDER_WIDTH = 1.0;

  final double height;
  final String text;

  HeaderLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.text,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              child: HeaderTitleText(text),
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      height: this.height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}