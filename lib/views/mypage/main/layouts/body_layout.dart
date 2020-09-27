import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/mypage/main/layouts/my_list_buttons_layout.dart';
import 'package:dotorimarket/views/mypage/main/layouts/my_profile_layout.dart';
import 'package:dotorimarket/views/mypage/main/layouts/text_buttons_layout.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const double VERTICAL_PADDING = 10.0;
  static const double MY_PROFILE_VERTICAL_PADDING = 20.0;
  static const double MY_PROFILE_HORIZONTAL_PADDING = 15.0;
  static const double MY_PROFILE_VERTICAL_MARGIN = 20.0;
  static const double CIRCLE_BUTTONS_VERTICAL_PADDING = 10.0;
  static const double CIRCLE_BUTTONS_HORIZONTAL_PADDING = 20.0;
  static const double TEXT_BUTTONS_TOP_PADDING = 20.0;
  static const double DIVIDER_HEIGHT = 0.0;

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
          Divider(
            height: DIVIDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
          Container(
            child: MyListButtonsLayout(),
          ),
          Divider(
            height: DIVIDER_HEIGHT,
            color: ColorConstant.BACKGROUND_GREY,
          ),
          Container(
            child: TextButtonsLayout(),
            padding: const EdgeInsets.only(
              top: TEXT_BUTTONS_TOP_PADDING,
            ),
          ),
        ],
      ),
    );
  }
}