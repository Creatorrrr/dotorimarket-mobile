import 'package:dotorimarket/views/sell/layouts/tab_selling_layout.dart';
import 'package:dotorimarket/views/sell/widgets/body_tab_bar.dart';
import 'package:dotorimarket/views/sell/widgets/body_tab_bar_view.dart';
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
                  child: Text(
                    TAB_SELLING,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
              ),
              Tab(
                  child: Text(
                    TAB_DEALT,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
              ),
              Tab(
                  child: Text(
                    TAB_RESERVING,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
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
