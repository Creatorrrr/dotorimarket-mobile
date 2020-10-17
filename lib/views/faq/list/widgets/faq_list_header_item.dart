import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FaqListHeaderItem extends StatelessWidget {
  static const bool IS_EXPANDED_DEFAULT = false;

  static const double TITLE_FONT_SIZE = 16.0;
  static const double TYPE_FONT_SIZE = 14.0;
  static const double TIME_FONT_SIZE = 14.0;
  static const Color TYPE_COLOR = ColorConstant.DEEP_YELLOW;
  static const double TYPE_TIME_SEPARATOR_HORIZONTAL_MARGIN = 5.0;
  static const double TYPE_TIME_TOP_MARGIN = 5.0;
  static const double TYPE_TIME_SEPARATOR_FONT_SIZE = 14.0;
  static const Color TIME_COLOR = ColorConstant.TEXT_GREY;
  static const Color TIME_SEPARATOR_COLOR = ColorConstant.TEXT_LIGHT_GREY;
  static const Color ICON_COLOR = ColorConstant.TEXT_LIGHT_GREY;

  static const String TYPE_TIME_SEPARATOR = '|';
  static const String TIME_FORMAT = 'yyyy년 MM월 dd일';

  final String title;
  final DateTime time;
  final bool isExpanded;
  final void Function() onPressed;

  FaqListHeaderItem({
    Key key,
    @required this.title,
    @required this.time,
    this.isExpanded = IS_EXPANDED_DEFAULT,
    this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: TITLE_FONT_SIZE,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text(DateFormat(TIME_FORMAT).format(time),
                            style: const TextStyle(
                              fontSize: TIME_FONT_SIZE,
                              color: TIME_COLOR,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(
                      top: TYPE_TIME_TOP_MARGIN,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          Container(
            child: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: ICON_COLOR,
            ),
          )
        ],
      ),
    );
  }
}