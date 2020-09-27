import 'package:dotorimarket/views/mypage/favorite/favorite_list_page.dart';
import 'package:dotorimarket/views/mypage/main/widgets/my_list_button.dart';
import 'package:dotorimarket/views/mypage/purchase/purchase_list_page.dart';
import 'package:dotorimarket/views/mypage/sell/sell_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListButtonsLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const double VERTICAL_PADDING = 20.0;
  static const double VERTICAL_DIVIDER_WIDTH = 0.0;

  static const String SALE_LIST_BUTTON_TEXT = '판매내역';
  static const String PURCHASE_LIST_BUTTON_TEXT = '구매내역';
  static const String FAVORITE_LIST_BUTTON_TEXT = '관심목록';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: MyListButton(
                  text: SALE_LIST_BUTTON_TEXT,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => SellListPage())
                    );
                  },
                ),
              ),
              flex: 1,
            ),
            VerticalDivider(
              width: VERTICAL_DIVIDER_WIDTH,
            ),
            Expanded(
              child: Container(
                child: MyListButton(
                  text: PURCHASE_LIST_BUTTON_TEXT,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => PurchaseListPage())
                    );
                  },
                ),
              ),
              flex: 1,
            ),
            VerticalDivider(
              width: VERTICAL_DIVIDER_WIDTH,
            ),
            Expanded(
              child: Container(
                child: MyListButton(
                  text: FAVORITE_LIST_BUTTON_TEXT,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => FavoriteListPage())
                    );
                  },
                ),
              ),
              flex: 1,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}