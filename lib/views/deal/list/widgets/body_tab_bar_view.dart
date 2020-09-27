import 'package:flutter/material.dart';

class BodyTabBarView extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 5.0;

  final TabController tabController;
  final List<Widget> views;

  BodyTabBarView({
    Key key,
    @required this.tabController,
    @required this.views,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(
        controller: tabController,
        children: views,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
    );
  }
}