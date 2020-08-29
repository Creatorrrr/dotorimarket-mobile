import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';
  static const double VERTICAL_PADDING = 10.0;
  static const double SETTING_ITEM_VERTICAL_PADDING = 15.0;
  static const double SETTING_ITEM_HORIZONTAL_PADDING = 20.0;
  static const double MY_PROFILE_VERTICAL_MARGIN = 20.0;
  static const double CIRCLE_BUTTONS_VERTICAL_PADDING = 10.0;
  static const double CIRCLE_BUTTONS_HORIZONTAL_PADDING = 20.0;
  static const double TEXT_BUTTONS_VERTICAL_PADDING = 5.0;
  static const double TEXT_BUTTONS_HORIZONTAL_PADDING = 50.0;
  static const double DIVIDER_HEIGHT = 40.0;

  static const String IMPORTANT_NOTICE_TEXT = '중요 알림';
  static const String EXTRA_NOTICE_TEXT = '기타 알림';
  static const String VERSION_PREFIX_TEXT = '버전';
  static const String LOGOUT_TEXT = '로그아웃';
  static const String WITHDRAW_TEXT = '탈퇴하기';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              IMPORTANT_NOTICE_TEXT,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: Text(
              EXTRA_NOTICE_TEXT,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: 30.0,
          ),
          Container(
            child: Text(
              VERSION_PREFIX_TEXT + ' ' + '1.1.1',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: Text(
              LOGOUT_TEXT,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: Text(
              WITHDRAW_TEXT,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}