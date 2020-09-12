import 'package:dotorimarket/views/mypage/favorite/favorite_list_page.dart';
import 'package:dotorimarket/views/mypage/main/widgets/my_page_circle_button.dart';
import 'package:dotorimarket/views/mypage/purchase/purchase_list_page.dart';
import 'package:dotorimarket/views/mypage/sell/sell_list_page.dart';
import 'package:dotorimarket/views/mypage/sell/widgets/sell_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButtonsLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return SellListPage();
                  }
                ));
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: MyPageCircleButton(
              image: AssetImage(THUMBNAIL_PATH),
              text: PURCHASE_LIST_BUTTON_TEXT,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return PurchaseListPage();
                  }
                ));
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: MyPageCircleButton(
              image: AssetImage(THUMBNAIL_PATH),
              text: FAVORITE_LIST_BUTTON_TEXT,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (context) {
                    return FavoriteListPage();
                  }
                ));
              },
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}