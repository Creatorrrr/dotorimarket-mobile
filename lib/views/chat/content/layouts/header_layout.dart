import 'package:dotorimarket/constants/color_constant.dart';
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
                  child: HeaderTitleText(text),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          Positioned(
            child: Row(
              children: [
                Container(
                  child: PopupMenuButton(
                    icon: Icon(Icons.more_horiz),
                    onSelected: (value) {

                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        value: 1,
                        child: Text('신고하기'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('알림끄기'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('중요 채팅방으로 표시'),
                      ),
                      const PopupMenuItem(
                        value: 4,
                        child: Text('채팅방 나가기'),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
