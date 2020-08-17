import 'package:dotorimarket/views/mypage/widgets/my_page_circle_button.dart';
import 'package:flutter/cupertino.dart';

class CircleButtonsLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';

  static const String SALE_LIST_BUTTON_TEXT = '판매내역';
  static const String PURCHASE_LIST_BUTTON_TEXT = '구매내역';
  static const String FAVORITE_LIST_BUTTON_TEXT = '관심목록';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: MyPageCircleButton(
              image: AssetImage(THUMBNAIL_PATH),
              text: SALE_LIST_BUTTON_TEXT,
            ),
            flex: 1,
          ),
          Expanded(
            child: MyPageCircleButton(
              image: AssetImage(THUMBNAIL_PATH),
              text: PURCHASE_LIST_BUTTON_TEXT,
            ),
            flex: 1,
          ),
          Expanded(
            child: MyPageCircleButton(
              image: AssetImage(THUMBNAIL_PATH),
              text: FAVORITE_LIST_BUTTON_TEXT,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}