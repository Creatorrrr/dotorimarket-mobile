import 'package:dotorimarket/views/chat/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 10.0;
  static const double HEADER_TEXT_LEFT_PADDING = 15.0;

  static const String HEADER_TEXT = '설정';

  final double height;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
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
              child: Text(
                HEADER_TEXT,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: const EdgeInsets.only(
                left: HEADER_TEXT_LEFT_PADDING,
              ),
            ),
          ),
        ],
      ),
      height: this.height,
    );
  }
}