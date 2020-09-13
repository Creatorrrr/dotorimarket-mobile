import 'package:dotorimarket/views/deal/list/layouts/tab_all_layout.dart';
import 'package:dotorimarket/views/deal/list/layouts/tab_best_layout.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar_text.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  BodyLayout({
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => BodyLayoutState();
}

class BodyLayoutState extends State<BodyLayout> with SingleTickerProviderStateMixin {
  static const String TAB_ALL = '전체';
  static const String TAB_BEST = '베스트';

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
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
                child: BodyTabBarText(TAB_ALL),
              ),
              Tab(
                child: BodyTabBarText(TAB_BEST),
              ),
            ],
          ),
          Expanded(
            child: BodyTabBarView(
              tabController: this.tabController,
              views: <Widget>[
                TabAllLayout(),
                TabBestLayout(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}