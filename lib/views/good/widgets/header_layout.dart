import 'package:dotorimarket/views/good/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/good/widgets/header_logo_image.dart';
import 'package:dotorimarket/views/good/widgets/header_search_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEADER_TOP_DEFAULT = 45.0;
  static const double HEADER_ROW_PADDING = 5.0;

  final double height;
  final String logoPath;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_DEFAULT,
    @required this.logoPath,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: Row(
        children: <Widget>[
          Container(
            child: HeaderLogoImage(
              image: this.logoPath,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
          Expanded(
            child: Container(
              child: HeaderSearchButton(
                onPressed: () {

                },
              ),
              padding: EdgeInsets.symmetric(
                horizontal: HEADER_ROW_PADDING,
              ),
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.tune),
              onPressed: () {

              },
            ),
            padding: EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {

              },
            ),
            padding: EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
        ],
      ),
    );
  }
}