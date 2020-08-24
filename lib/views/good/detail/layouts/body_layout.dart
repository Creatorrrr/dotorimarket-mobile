import 'package:dotorimarket/views/good/detail/layouts/good_profile_layout.dart';
import 'package:dotorimarket/views/good/detail/layouts/my_profile_layout.dart';
import 'package:dotorimarket/views/good/detail/widgets/main_image.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/dotori-logo.png';
  static const double GOOD_PROFILE_VERTICAL_PADDING = 15.0;
  static const double GOOD_PROFILE_HORIZONTAL_PADDING = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MainImage(
            image: GOOD_IMAGE_PATH,
          ),
          Divider(
            height: 0,
          ),
          Container(
            child: GoodProfileLayout(
              title: '아이패드 미니 2세대 32GB WIFI',
              price: 200000,
              description: '아이패드 팝니다. 아이패드 미니 짱 좋아요. 꼭 사세요.\n8층 직거래 희망합니다.',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: GOOD_PROFILE_VERTICAL_PADDING,
              horizontal: GOOD_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            child: MyProfileLayout(
              name: '을지로짱',
              description: '친절해요',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: GOOD_PROFILE_VERTICAL_PADDING,
              horizontal: GOOD_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}