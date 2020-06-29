import 'package:flutter/material.dart';

class BodyTabBar extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 45.0;
  static const MaterialColor INDICATOR_COLOR_DEFAULT = Colors.amber;
  static const double INDICATOR_WEIGHT_DEFAULT = 4.0;
  static const double LABEL_FONT_SIZE = 16.0;
  static const FontWeight LABEL_FONT_WEIGHT = FontWeight.bold;
  static const double UNSELECTED_LABEL_FONT_SIZE = 16.0;

  final double height;
  final MaterialColor indicatorColor;
  final double indicatorWeight;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final double unselectedLabelFontSize;
  final TabController tabController;
  final List<Tab> tabs;

  BodyTabBar({
    Key key,
    this.height = HEIGHT_DEFAULT,
    this.indicatorColor = INDICATOR_COLOR_DEFAULT,
    this.indicatorWeight = INDICATOR_WEIGHT_DEFAULT,
    this.labelFontSize = LABEL_FONT_SIZE,
    this.labelFontWeight = LABEL_FONT_WEIGHT,
    this.unselectedLabelFontSize = UNSELECTED_LABEL_FONT_SIZE,
    @required this.tabController,
    @required this.tabs,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: TabBar(
        tabs: this.tabs,
        controller: this.tabController,
        indicatorColor: this.indicatorColor,
        indicatorWeight: this.indicatorWeight,
        labelStyle: TextStyle(
          fontSize: this.labelFontSize,
          fontWeight: this.labelFontWeight,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: this.unselectedLabelFontSize,
        ),
      ),
    );
  }
}