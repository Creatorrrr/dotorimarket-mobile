import 'package:dotorimarket/views/chat/widgets/chat_content_input_text_field.dart';
import 'package:dotorimarket/views/common/widgets/menu_item_button.dart';
import 'package:flutter/material.dart';

class ChatInputLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HORIZONTAL_PADDING = 15.0;
  static const String MENU_ITEM_HOME = '홈';
  static const String MENU_ITEM_CATEGORY = '카테고리';
  static const String MENU_ITEM_WRITE = '글쓰기';
  static const String MENU_ITEM_CHAT = '대화';
  static const String MENU_ITEM_MY_PAGE = '마이페이지';

  final double height;
  final TextEditingController controller;

  ChatInputLayout({
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
                horizontal: 20.0
              ),
            ),
          ),
          Container(
            child: Icon(
              Icons.send,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: this.height,
      padding: EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}