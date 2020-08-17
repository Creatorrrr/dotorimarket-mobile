import 'package:dotorimarket/views/mypage/widgets/my_page_circle_button.dart';
import 'package:dotorimarket/views/mypage/widgets/my_page_text_button.dart';
import 'package:flutter/cupertino.dart';

class TextButtonsLayout extends StatelessWidget {
  static const double VERTICAL_PADDING = 5.0;

  static const String LOGIN_BUTTON_TEXT = '로그인';
  static const String GOOD_MODIFY_BUTTON_TEXT = '상품 수정';
  static const String GOOD_REMOVE_BUTTON_TEXT = '상품 삭제';
  static const String MY_ACCOUNT_BUTTON_TEXT = '내 계정보기';
  static const String NICK_NAME_BUTTON_TEXT = '닉네임변경';
  static const String NOTICE_BUTTON_TEXT = '공지사항';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: MyPageTextButton(
              text: LOGIN_BUTTON_TEXT,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
          Container(
            child: MyPageTextButton(
              text: GOOD_MODIFY_BUTTON_TEXT,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
          Container(
            child: MyPageTextButton(
              text: GOOD_REMOVE_BUTTON_TEXT,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
          Container(
            child: MyPageTextButton(
                text: MY_ACCOUNT_BUTTON_TEXT
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
          Container(
            child: MyPageTextButton(
                text: NICK_NAME_BUTTON_TEXT
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
          Container(
            child: MyPageTextButton(
                text: NOTICE_BUTTON_TEXT
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: VERTICAL_PADDING,
            ),
          ),
        ],
      ),
    );
  }
}