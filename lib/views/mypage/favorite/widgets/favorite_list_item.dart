import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/constants/color_constant.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavoriteListItem extends StatefulWidget {
  final DealDto deal;
  final void Function() onItemPressed;
  final void Function(bool favorite) onFavoritePressed;

  FavoriteListItem(this.deal, {
    Key key,
    @required this.onItemPressed,
    @required this.onFavoritePressed,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteListItemState();
}

class _FavoriteListItemState extends State<FavoriteListItem> {
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

  bool favorite;

  @override
  void initState() {
    favorite = true;
    super.initState();
  }

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
                      child: widget.deal.thumbnails != null && widget.deal.thumbnails.length > 0
                        ? Image.network('${HttpConfig.URL_FILE_PREFIX}/${widget.deal.thumbnails[0].filename}',
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
                              child: Text(widget.deal.title,
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
                              child: Text('${numberFormat.format(widget.deal.price)}원',
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
                    child: IconButton(
                      icon: Icon(Icons.favorite),
                      color: favorite ? Colors.red : Colors.black45,
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                          widget.onFavoritePressed(favorite);
                        });
                      },
                    ),
                    alignment: Alignment.topCenter,
                    width: 70.0,
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
            onTap: widget.onItemPressed,
          ),
        ],
      ),
    );
  }
}