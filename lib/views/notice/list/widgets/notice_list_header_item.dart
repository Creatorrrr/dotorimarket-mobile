import 'package:flutter/material.dart';

class NoticeListHeaderItem extends StatefulWidget {
  static const bool IS_EXPANDED_DEFAULT = false;

  final String title;
  final String type;
  final String time;
  final bool isExpanded;
  final void Function(bool isExpanded) onPressed;

  NoticeListHeaderItem({
    Key key,
    @required this.title,
    @required this.type,
    @required this.time,
    this.isExpanded = IS_EXPANDED_DEFAULT,
    this.onPressed,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _NoticeListHeaderItemState();
}
class _NoticeListHeaderItemState extends State<NoticeListHeaderItem> {
  static const double TITLE_FONT_SIZE = 16.0;
  static const double TYPE_FONT_SIZE = 14.0;
  static const double TIME_FONT_SIZE = 14.0;
  static const Color TYPE_COLOR = Color.fromRGBO(248, 176, 36, 1.0);
  static const double TYPE_TIME_SEPARATOR_HORIZONTAL_MARGIN = 5.0;
  static const double TYPE_TIME_TOP_MARGIN = 5.0;
  static const double TYPE_TIME_SEPARATOR_FONT_SIZE = 14.0;
  static const Color TIME_COLOR = Color.fromRGBO(172, 172, 172, 1.0);
  static const Color TIME_SEPARATOR_COLOR = Color.fromRGBO(172, 172, 172, 1.0);

  static const String TYPE_TIME_SEPARATOR = '|';

  bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isExpanded;
    super.initState();
  }

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
                    child: Text(widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: TITLE_FONT_SIZE,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text(widget.type,
                            style: TextStyle(
                              fontSize: TYPE_FONT_SIZE,
                              color: TYPE_COLOR,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: Text(TYPE_TIME_SEPARATOR,
                            style: const TextStyle(
                              fontSize: TYPE_TIME_SEPARATOR_FONT_SIZE,
                              color: TIME_SEPARATOR_COLOR,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: TYPE_TIME_SEPARATOR_HORIZONTAL_MARGIN,
                          ),
                        ),
                        Container(
                          child: Text(widget.time,
                            style: TextStyle(
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
            child: IconButton(
              icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                if (widget.onPressed != null) widget.onPressed(isExpanded);
              },
            ),
          )
        ],
      ),
    );
  }
}