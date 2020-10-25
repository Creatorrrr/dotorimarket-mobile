import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/views/deal/list/layouts/tab_all_layout.dart';
import 'package:dotorimarket/views/deal/list/layouts/tab_best_layout.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar_text.dart';
import 'package:dotorimarket/views/deal/list/widgets/body_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  final List<DealDto> dealList;

  BodyLayout(this.dealList, {
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> with SingleTickerProviderStateMixin {
  // static const String TAB_ALL = '전체';
  // static const String TAB_BEST = '베스트';

  // TabController tabController;
  //
  // /// state 초기화
  // void _init() {
  //   tabController = TabController(
  //     length: 2,
  //     vsync: this,
  //   );
  // }
  //
  // @override
  // void initState() {
  //   _init();
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabAllLayout(widget.dealList),
      // child: Column(
      //   children: <Widget>[
      //     BodyTabBar(
      //       tabController: this.tabController,
      //       tabs: <Tab>[
      //         Tab(
      //           child: BodyTabBarText(TAB_ALL),
      //         ),
      //         Tab(
      //           child: BodyTabBarText(TAB_BEST),
      //         ),
      //       ],
      //     ),
      //     Expanded(
      //       child: BodyTabBarView(
      //         tabController: this.tabController,
      //         views: <Widget>[
      //           TabAllLayout(),
      //           TabBestLayout(),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}