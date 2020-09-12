import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/good/list/widgets/header_logo_image.dart';
import 'package:dotorimarket/views/good/list/widgets/header_search_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 5.0;

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
            child: HeaderLogoImage(
              image: this.logoPath,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
          Expanded(
            child: Container(
              child: HeaderSearchButton(
                onPressed: () {

                },
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: HEADER_ROW_PADDING,
              ),
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {

              },
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: const Icon(Icons.notifications_none),
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
      padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}