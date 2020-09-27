import 'package:dotorimarket/views/mypage/main/widgets/my_page_text_button.dart';
import 'package:dotorimarket/views/mypage/profile/profile_page.dart';
import 'package:dotorimarket/views/notice/list/notice_list_page.dart';
import 'package:dotorimarket/views/setting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonsLayout extends StatelessWidget {
  static const String PROFILE_BUTTON_TEXT = '프로필 보기';
  static const String NOTICE_BUTTON_TEXT = '공지사항';
  static const String FAQ_BUTTON_TEXT = '자주 묻는 질문';
  static const String SETTING_BUTTON_TEXT = '앱 설정';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: MyPageTextButton(
              text: PROFILE_BUTTON_TEXT,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) => ProfilePage())
                );
              },
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: MyPageTextButton(
              text: NOTICE_BUTTON_TEXT,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => NoticeListPage())
                );
              },
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: MyPageTextButton(
              text: FAQ_BUTTON_TEXT,
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: MyPageTextButton(
              text: SETTING_BUTTON_TEXT,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => SettingPage())
                );
              },
            ),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}