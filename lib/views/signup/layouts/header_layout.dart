import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/common/widgets/header_title_text.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TITLE_LEFT_PADDING = 15.0;
  static const double HEADER_BOTTOM_BORDER_WIDTH = 1.0;
  static const double HEADER_RIGHT_BUTTON_FONT_SIZE = 16.0;
  static const double HEADER_RIGHT_BUTTON_RIGHT_PADDING = 15.0;

  static const String HEADER_TEXT = '회원가입';
  static const String COMPLETE_TEXT = '완료';

  final double height;
  final Function onComplete;

  HeaderLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.onComplete,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Row(
              children: [
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
                Container(
                  child: HeaderTitleText(HEADER_TEXT),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          Positioned(
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    child: Text(COMPLETE_TEXT,
                      style: const TextStyle(
                        fontSize: HEADER_RIGHT_BUTTON_FONT_SIZE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      right: HEADER_RIGHT_BUTTON_RIGHT_PADDING,
                    ),
                  ),
                  onTap: onComplete,
                ),
              ],
            ),
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
          ),
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
