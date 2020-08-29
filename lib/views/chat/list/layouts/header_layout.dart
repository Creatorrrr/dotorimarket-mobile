import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 5.0;

  final double height;
  final String title;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
    @required this.title,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      height: this.height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
    );
  }
}