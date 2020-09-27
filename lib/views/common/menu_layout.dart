import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/views/category/category_list_page.dart';
import 'package:dotorimarket/views/chat/list/chat_list_page.dart';
import 'package:dotorimarket/views/common/widgets/menu_item_button.dart';
import 'package:dotorimarket/views/deal/list/deal_list_page.dart';
import 'package:dotorimarket/views/deal/register/deal_register_page.dart';
import 'package:dotorimarket/views/mypage/main/mypage_page.dart';
import 'package:flutter/material.dart';

class MenuLayout extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TOP_BORDER_WIDTH = 1.0;

  static const String MENU_ITEM_HOME = '홈';
  static const String MENU_ITEM_CATEGORY = '카테고리';
  static const String MENU_ITEM_WRITE = '글쓰기';
  static const String MENU_ITEM_CHAT = '대화';
  static const String MENU_ITEM_MY_PAGE = '마이페이지';

  final double height;
  final Function onHomePressed;
  final Function onCategoryPressed;
  final Function onWritePressed;
  final Function onChatPressed;
  final Function onMyPagePressed;

  MenuLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
    this.onHomePressed,
    this.onCategoryPressed,
    this.onWritePressed,
    this.onChatPressed,
    this.onMyPagePressed,
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
              onPressed: onHomePressed ?? () {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                    => DealListPage(),
                ));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.menu,
              name: MENU_ITEM_CATEGORY,
              onPressed: onCategoryPressed ?? () {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                    => CategoryListPage(),
                ));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.add_circle_outline,
              name: MENU_ITEM_WRITE,
              onPressed: onWritePressed ?? () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                    => DealRegisterPage(),
                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                    Offset begin = Offset(0.0, 1.0);
                    Offset end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end);
                    var curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    );

                    return SlideTransition(
                      position: tween.animate(curvedAnimation),
                      child: child,
                    );
                  },
                ));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.chat_bubble_outline,
              name: MENU_ITEM_CHAT,
              onPressed: onChatPressed ?? () {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                    => ChatListPage(),
                ));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuItemButton(
              icon: Icons.perm_identity,
              name: MENU_ITEM_MY_PAGE,
              onPressed: onMyPagePressed ?? () {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                    => MyPagePage(),
                ));
              },
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      height: this.height,
      decoration: const BoxDecoration(
        border: const Border(
          top: const BorderSide(
            width: HEADER_TOP_BORDER_WIDTH,
            color: ColorConstant.BACKGROUND_GREY,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}
