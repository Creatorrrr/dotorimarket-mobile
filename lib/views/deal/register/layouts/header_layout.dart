import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/common/widgets/header_title_text.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TEXT_SIZE = 16.0;
  static const double BOTTOM_BORDER_WIDTH = 1.0;

  static const String HEADER_TEXT = '글쓰기';

  final double height;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              child: HeaderTitleText(HEADER_TEXT),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            child: HeaderIconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
            top: 0.0,
            bottom: 0.0,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.BACKGROUND_GREY,
            width: BOTTOM_BORDER_WIDTH,
          ),
        ),
      ),
      height: height,
    );
  }
}
