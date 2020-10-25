import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/common/widgets/header_title_text.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TITLE_LEFT_PADDING = 15.0;
  static const double HEADER_BOTTOM_BORDER_WIDTH = 1.0;

  static const String HEADER_TEXT = '카테고리';

  final double height;

  HeaderLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              child: HeaderTitleText(HEADER_TEXT),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                left: HEADER_TITLE_LEFT_PADDING,
              ),
            ),
          ),
          // Positioned(
          //   child: Row(
          //     children: [
          //       Container(
          //         child: HeaderIconButton(
          //           icon: Icon(Icons.search),
          //           onPressed: () {
          //
          //           },
          //         ),
          //       ),
          //       Container(
          //         child: HeaderIconButton(
          //           icon: Icon(Icons.notifications_none),
          //           onPressed: () {
          //
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          //   top: 0.0,
          //   bottom: 0.0,
          //   right: 0.0,
          // ),
        ],
      ),
      height: height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: HEADER_BOTTOM_BORDER_WIDTH,
            color: ColorConstant.BACKGROUND_GREY,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}