import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/login/login_page.dart';
import 'package:dotorimarket/views/setting/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class BodyLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
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
            child: SettingButton(
              text: IMPORTANT_NOTICE_TEXT,
              onPressed: () {
                // TODO 중요 알림 페이지로 이동
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: SettingButton(
              text: EXTRA_NOTICE_TEXT,
              onPressed: () {
                // TODO 기타 알림 페이지로 이동
              },
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
            child: CheckedFutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                return Text('$VERSION_PREFIX_TEXT ${snapshot.data.version}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                );
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: SettingButton(
              text: LOGOUT_TEXT,
              onPressed: () {
                // 로그인 페이지로 이동
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return LoginPage();
                  },
                ), (route) => false);
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SETTING_ITEM_VERTICAL_PADDING,
              horizontal: SETTING_ITEM_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: SettingButton(
              text: WITHDRAW_TEXT,
              onPressed: () {
                // TODO 탈퇴하기 페이지로 이동
              },
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