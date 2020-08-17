import 'package:dotorimarket/views/chat/widgets/chat_content_list_item.dart';
import 'package:dotorimarket/views/chat/widgets/chat_content_list_time.dart';
import 'package:dotorimarket/views/mypage/circle_buttons_layout.dart';
import 'package:dotorimarket/views/mypage/my_profile_layout.dart';
import 'package:dotorimarket/views/mypage/text_buttons_layout.dart';
import 'package:dotorimarket/views/mypage/widgets/my_page_circle_button.dart';
import 'package:dotorimarket/views/mypage/widgets/my_page_text_button.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';
  static const double VERTICAL_PADDING = 10.0;
  static const double MY_PROFILE_VERTICAL_PADDING = 20.0;
  static const double MY_PROFILE_HORIZONTAL_PADDING = 10.0;
  static const double MY_PROFILE_VERTICAL_MARGIN = 20.0;
  static const double CIRCLE_BUTTONS_VERTICAL_PADDING = 10.0;
  static const double CIRCLE_BUTTONS_HORIZONTAL_PADDING = 20.0;
  static const double TEXT_BUTTONS_VERTICAL_PADDING = 5.0;
  static const double TEXT_BUTTONS_HORIZONTAL_PADDING = 50.0;
  static const double DIVIDER_HEIGHT = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: MyProfileLayout(
              name: '을지로짱',
              description: '페럼타워',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: MY_PROFILE_VERTICAL_PADDING,
              horizontal: MY_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: CircleButtonsLayout(),
            padding: const EdgeInsets.symmetric(
              vertical: CIRCLE_BUTTONS_VERTICAL_PADDING,
              horizontal: CIRCLE_BUTTONS_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: DIVIDER_HEIGHT,
          ),
          Container(
            child: TextButtonsLayout(),
            padding: const EdgeInsets.symmetric(
              horizontal: TEXT_BUTTONS_HORIZONTAL_PADDING,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}