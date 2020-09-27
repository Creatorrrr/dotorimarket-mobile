import 'package:dotorimarket/views/mypage/main/layouts/my_list_buttons_layout.dart';
import 'package:dotorimarket/views/mypage/main/layouts/my_profile_layout.dart';
import 'package:dotorimarket/views/mypage/main/layouts/text_buttons_layout.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double PROFILE_IMAGE_RADIUS = 80.0;
  static const double PROFILE_VERTICAL_PADDING = 20.0;
  static const double NICKNAME_LABEL_SIZE = 12.0;
  static const double NICKNAME_HINT_SIZE = 14.0;
  static const double NICKNAME_WIDTH = 200.0;

  static const String NICKNAME_LABEL_TEXT = '닉네임';
  static const String NICKNAME_HINT_TEXT = '닉네임을 입력해주세요';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage(THUMBNAIL_PATH),
              radius: PROFILE_IMAGE_RADIUS,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: PROFILE_VERTICAL_PADDING,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: NICKNAME_LABEL_TEXT,
                labelStyle: TextStyle(
                  fontSize: NICKNAME_LABEL_SIZE,
                ),
                hintText: NICKNAME_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: NICKNAME_HINT_SIZE,
                ),
              ),
            ),
            width: NICKNAME_WIDTH,
          )
        ],
      ),
    );
  }
}