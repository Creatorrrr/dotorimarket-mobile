import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SellSellingListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const int MODIFY_DEAL = 1;
  static const int DELETE_DEAL = 2;

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
  static const String TO_FINISHED_TEXT = '거래완료로 변경';
  static const String DELETE_DIALOG_TEXT = '삭제하시겠습니까?';
  static const String CANCEL_TEXT = '취소';
  static const String DELETE_TEXT = '삭제하기';

  final DealDto deal;
  final void Function() onItemPressed;
  final void Function() onModifyPressed;
  final void Function() onDeletePressed;
  final void Function() onToReservingPressed;
  final void Function() onToFinishedPressed;

  SellSellingListItem(this.deal, {
    Key key,
    @required this.onItemPressed,
    @required this.onModifyPressed,
    @required this.onDeletePressed,
    @required this.onToReservingPressed,
    @required this.onToFinishedPressed,
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
                      child: deal.thumbnails != null && deal.thumbnails.length > 0
                        ? Image.network('${HttpConfig.URL_FILE_PREFIX}/${deal.thumbnails[0].filename}',
                          fit: BoxFit.cover,
                        )
                        : Image.asset(THUMBNAIL_PATH,
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
                              child: Text(deal.title,
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
                              child: Text('${numberFormat.format(deal.price)}원',
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
                    child: PopupMenuButton(
                      onSelected: (int value) async {
                        switch(value) {
                          case MODIFY_DEAL:
                            onModifyPressed();
                            break;
                          case DELETE_DEAL:
                            await showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: Text(DELETE_DIALOG_TEXT),
                                  actions: [
                                    FlatButton(
                                      child: Text(CANCEL_TEXT),
                                      onPressed: () {
                                        Navigator.pop(dialogContext);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(DELETE_TEXT),
                                      onPressed: onDeletePressed,
                                    ),
                                  ],
                                );
                              }
                            );
                            break;
                          default:
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                        const PopupMenuItem(
                          value: 1,
                          child: Text('수정하기'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('삭제하기'),
                        ),
                      ],
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
                      child: const Text(TO_FINISHED_TEXT,
                        style: const TextStyle(
                          fontSize: BOTTOM_BUTTON_FONT_SIZE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: onToFinishedPressed,
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