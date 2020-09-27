import 'package:flutter/material.dart';

class TitleLayout extends StatelessWidget {
  static const double TITLE_FONT_SIZE = 28.0;
  static const double SUBTITLE_FONT_SIZE = 16.0;

  static const String APP_TITLE_TEXT = '반가워요.';
  static const String APP_SUBTITLE_TEXT = '도토리마켓 이용을 위해 로그인 해주세요.';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: const Text(APP_TITLE_TEXT,
              style: const TextStyle(
                fontSize: TITLE_FONT_SIZE,
              ),
            ),
          ),
          Container(
            child: const Text(APP_SUBTITLE_TEXT,
              style: const TextStyle(
                fontSize: SUBTITLE_FONT_SIZE,
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}