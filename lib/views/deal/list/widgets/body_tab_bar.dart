import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';

class BodyTabBar extends StatelessWidget {
  static const double HEIGHT_DEFAULT = 45.0;
  static const double HORIZONTAL_PADDING = 15.0;
  static const Color INDICATOR_COLOR_DEFAULT = ColorConstant.DEEP_YELLOW;
  static const double INDICATOR_WEIGHT_DEFAULT = 4.0;
  static const double LABEL_FONT_SIZE = 16.0;
  static const FontWeight LABEL_FONT_WEIGHT = FontWeight.bold;
  static const double UNSELECTED_LABEL_FONT_SIZE = 16.0;
  static const double BOTTOM_BORDER_WIDTH = 1.0;

  final double height;
  final Color indicatorColor;
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
      child: TabBar(
        tabs: tabs,
        controller: tabController,
        indicatorColor: indicatorColor,
        indicatorWeight: indicatorWeight,
        labelStyle: TextStyle(
          fontSize: labelFontSize,
          fontWeight: labelFontWeight,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: this.unselectedLabelFontSize,
        ),
      ),
      height: height,
      padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: BOTTOM_BORDER_WIDTH,
            color: ColorConstant.BACKGROUND_GREY,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}