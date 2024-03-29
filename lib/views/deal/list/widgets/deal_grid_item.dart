import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealGridItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const Color IMAGE_BORDER_COLOR = Color.fromRGBO(225, 225, 225, 1);
  static const double IMAGE_BORDER_RADIUS = 5.0;
  static const double IMAGE_BORDER_WIDTH = 0.5;
  static const double IMAGE_ASPECT_RATIO = 1.0;
  static const double TITLE_TOP_PADDING = 10.0;
  static const double TITLE_FONT_SIZE = 16.0;
  static const double PRICE_TOP_PADDING = 5.0;
  static const double PRICE_FONT_SIZE = 16.0;
  static const double TEXT_LEFT_PADDING = 5.0;

  final DealDto deal;
  final Function onPressed;

  DealGridItem(this.deal, {
    Key key,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat();

    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: AspectRatio(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: IMAGE_BORDER_COLOR,
                      width: IMAGE_BORDER_WIDTH,
                    ),
                    image: DecorationImage(
                      image: NetworkImage('${HttpConfig.URL_FILE_PREFIX}/${deal.thumbnails[0].filename}',),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
                  ),
                ),
                aspectRatio: IMAGE_ASPECT_RATIO,
              ),
            ),
            Container(
              child: Text('${deal.status == 'F' ? '[판매완료]' : deal.status == 'R' ? '[예약중]' : ''} ${deal.title}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: TITLE_FONT_SIZE,
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                top: TITLE_TOP_PADDING,
                left: TEXT_LEFT_PADDING,
              ),
            ),
            Container(
              child: Text('${numberFormat.format(deal.price)}원',
                style: const TextStyle(
                  fontSize: PRICE_FONT_SIZE,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                top: PRICE_TOP_PADDING,
                left: TEXT_LEFT_PADDING,
              ),
            ),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}