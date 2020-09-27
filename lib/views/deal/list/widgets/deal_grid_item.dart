import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealGridItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  static const double IMAGE_BORDER_RADIUS = 5.0;
  static const double IMAGE_ASPECT_RATIO = 1.0;
  static const double TITLE_TOP_PADDING = 10.0;
  static const double TITLE_FONT_SIZE = 16.0;
  static const double PRICE_TOP_PADDING = 5.0;
  static const double PRICE_FONT_SIZE = 16.0;
  static const double TEXT_LEFT_PADDING = 5.0;

  final String title;
  final int price;
  final Function onPressed;

  DealGridItem({
    Key key,
    @required this.title,
    @required this.price,
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
                child: ClipRRect(
                  child: Image.asset(THUMBNAIL_PATH,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(IMAGE_BORDER_RADIUS),
                ),
                aspectRatio: IMAGE_ASPECT_RATIO,
              ),
            ),
            Container(
              child: Text(title,
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
              child: Text('${numberFormat.format(price)}원',
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