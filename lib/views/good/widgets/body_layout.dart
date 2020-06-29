import 'package:dotorimarket/views/good/widgets/tab_all_layout.dart';
import 'package:dotorimarket/views/good/widgets/body_tab_bar.dart';
import 'package:dotorimarket/views/good/widgets/body_tab_bar_view.dart';
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
  static const double TAB_BAR_VIEW_TOP = 45.0;

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
                  child: Text(
                    TAB_ALL,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
              ),
              Tab(
                  child: Text(
                    TAB_BEST,
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
                TabAllLayout(),
                TabAllLayout(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}