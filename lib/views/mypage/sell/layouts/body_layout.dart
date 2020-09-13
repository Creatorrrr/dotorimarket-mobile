import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar_text.dart';
import 'package:dotorimarket/views/mypage/sell/layouts/tab_selling_layout.dart';
import 'package:dotorimarket/views/mypage/sell/widgets/body_tab_bar.dart';
import 'package:dotorimarket/views/mypage/sell/widgets/body_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  BodyLayout({
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => BodyLayoutState();
}

class BodyLayoutState extends State<BodyLayout> with SingleTickerProviderStateMixin {
  static const String TAB_SELLING = '판매중';
  static const String TAB_DEALT = '거래완료';
  static const String TAB_RESERVING = '예약중';

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BodyTabBar(
            tabController: this.tabController,
            tabs: <Tab>[
              Tab(
                  child: BodyTabBarText(TAB_SELLING),
              ),
              Tab(
                  child: BodyTabBarText(TAB_DEALT),
              ),
              Tab(
                  child: BodyTabBarText(TAB_RESERVING),
              ),
            ],
          ),
          Expanded(
            child: BodyTabBarView(
              tabController: this.tabController,
              views: <Widget>[
                TabSellingLayout(),
                TabSellingLayout(),
                TabSellingLayout(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
