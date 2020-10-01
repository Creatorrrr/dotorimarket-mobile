import 'package:dotorimarket/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SellListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double IMAGE_SIZE = 80.0;
  static const double IMAGE_BORDER_RADIUS = 5.0;
  static const double TITLE_FONT_SIZE = 16.0;
  static const double TITLE_TOP_MARGIN = 5.0;
  static const double PRICE_FONT_SIZE = 14.0;
  static const double PRICE_TOP_MARGIN = 5.0;
  static const double TEXT_AREA_LEFT_MARGIN = 10.0;
  static const double ITEM_HORIZONTAL_PADDING = 15.0;
  static const double ITEM_VERTICAL_PADDING = 15.0;
  static const double BORDER_WIDTH = 1.0;
  static const Color BORDER_COLOR = ColorConstant.BACKGROUND_GREY;
  static const double VERTICAL_DIVIDER_THICKNESS = 1.0;
  static const double BOTTOM_BUTTON_FONT_SIZE = 12.0;
  static const double BOTTOM_BUTTON_HEIGHT = 35.0;

  static const String TO_RESERVING_TEXT = '예약중으로 변경';
  static const String TO_DEALT_TEXT = '거래완료로 변경';

  final String title;
  final int price;
  final Function onItemPressed;
  final Function onToReservingPressed;
  final Function onToDealtPressed;

  SellListItem({
    Key key,
    @required this.title,
    @required this.price,
    @required this.onItemPressed,
    @required this.onToReservingPressed,
    @required this.onToDealtPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat();

    return Container(
      child: Column(
        children: [
          InkWell(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      child: Image.asset(THUMBNAIL_PATH,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
                    ),
                    width: IMAGE_SIZE,
                    height: IMAGE_SIZE,
                  ),
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
                              margin: const EdgeInsets.only(
                                top: TITLE_TOP_MARGIN,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text('${numberFormat.format(price)}원',
                                style: TextStyle(
                                  fontSize: PRICE_FONT_SIZE,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              margin: const EdgeInsets.only(
                                top: PRICE_TOP_MARGIN,
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(
                          left: TEXT_AREA_LEFT_MARGIN,
                        ),
                      )
                  ),
                  Container(
                    child: GestureDetector(
                      child: const Icon(Icons.more_vert),
                      onTap: () {

                      },
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              decoration: const BoxDecoration(
                border: const Border(
                  bottom: const BorderSide(
                    width: BORDER_WIDTH,
                    color: BORDER_COLOR,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: ITEM_VERTICAL_PADDING,
                horizontal: ITEM_HORIZONTAL_PADDING,
              ),
            ),
            onTap: onItemPressed,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      child: const Text(TO_RESERVING_TEXT,
                        style: const TextStyle(
                          fontSize: BOTTOM_BUTTON_FONT_SIZE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: onToReservingPressed,
                  ),
                  flex: 1,
                ),
                VerticalDivider(
                  thickness: VERTICAL_DIVIDER_THICKNESS,
                  width: BORDER_WIDTH,
                  color: BORDER_COLOR,
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      child: const Text(TO_DEALT_TEXT,
                        style: const TextStyle(
                          fontSize: BOTTOM_BUTTON_FONT_SIZE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: onToDealtPressed,
                  ),
                  flex: 1,
                ),
              ],
            ),
            height: BOTTOM_BUTTON_HEIGHT,
            decoration: const BoxDecoration(
              border: const Border(
                bottom: const BorderSide(
                  width: BORDER_WIDTH,
                  color: BORDER_COLOR,
                )
              )
            ),
          ),
        ],
      ),
    );
  }
}