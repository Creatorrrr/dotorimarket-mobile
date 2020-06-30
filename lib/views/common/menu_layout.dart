import 'package:dotorimarket/views/common/widgets/menu_item_button.dart';
import 'package:flutter/material.dart';

class MenuLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HORIZONTAL_PADDING = 15.0;
  static const String MENU_ITEM_HOME = '홈';
  static const String MENU_ITEM_CATEGORY = '카테고리';
  static const String MENU_ITEM_WRITE = '글쓰기';
  static const String MENU_ITEM_CHAT = '대화';
  static const String MENU_ITEM_MY_PAGE = '마이페이지';

  final double height;

  MenuLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.home,
              name: MENU_ITEM_HOME,
              onPressed: () {

              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.menu,
              name: MENU_ITEM_CATEGORY,
              onPressed: () {

              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.add_circle_outline,
              name: MENU_ITEM_WRITE,
              onPressed: () {

              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.chat_bubble_outline,
              name: MENU_ITEM_CHAT,
              onPressed: () {

              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.perm_identity,
              name: MENU_ITEM_MY_PAGE,
              onPressed: () {

              },
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: this.height,
      padding: EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}