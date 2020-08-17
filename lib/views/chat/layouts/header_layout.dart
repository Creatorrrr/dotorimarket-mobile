import 'package:dotorimarket/views/chat/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/chat/widgets/header_title.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 10.0;

  final double height;
  final String logoPath;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
    @required this.logoPath,
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
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: Container(
              child: HeaderTitle(
                title: '을지로짱',
                time: 10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: HEADER_ROW_PADDING,
              ),
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {

              },
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
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