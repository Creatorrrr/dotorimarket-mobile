import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/chat/content/widgets/chat_content_input_text_field.dart';
import 'package:flutter/material.dart';

class FooterLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HORIZONTAL_PADDING = 15.0;
  static const double TOP_BORDER_HEIGHT = 1.0;
  static const double TEXT_FIELD_HORIZONTAL_PADDING = 20.0;

  static const String MENU_ITEM_HOME = '홈';
  static const String MENU_ITEM_CATEGORY = '카테고리';
  static const String MENU_ITEM_WRITE = '글쓰기';
  static const String MENU_ITEM_CHAT = '대화';
  static const String MENU_ITEM_MY_PAGE = '마이페이지';

  final double height;
  final TextEditingController controller;

  FooterLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.controller,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.camera_alt,
            ),
          ),
          Expanded(
            child: Container(
              child: ChatContentInputTextField(
                controller: this.controller,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: TEXT_FIELD_HORIZONTAL_PADDING,
              ),
            ),
          ),
          Container(
            child: const Icon(Icons.send),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: this.height,
      padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      decoration: const BoxDecoration(
        border: const Border(
          top: const BorderSide(
            width: TOP_BORDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
        ),
      ),
    );
  }
}