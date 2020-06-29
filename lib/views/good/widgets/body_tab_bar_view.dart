import 'package:flutter/material.dart';

class BodyTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<Widget> views;

  BodyTabBarView({
    Key key,
    @required this.tabController,
    @required this.views,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: this.tabController,
      children: this.views,
    );
  }
}