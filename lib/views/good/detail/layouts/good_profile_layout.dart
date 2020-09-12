import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class GoodProfileLayout extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/dotori-logo.png';

  static const double HORIZONTAL_PADDING = 25.0;
  static const double CATEGORY_FONT_SIZE = 12.0;
  static const double CATEGORY_TOP_PADDING = 20.0;
  static const double TITLE_FONT_SIZE = 18.0;
  static const double TITLE_TOP_PADDING = 10.0;
  static const double PRICE_FONT_SIZE = 18.0;
  static const double PRICE_VERTICAL_PADDING = 12.0;
  static const double CREATOR_IMAGE_RADIUS = 20.0;
  static const double CREATOR_NAME_SIZE = 14.0;
  static const double CREATOR_NAME_LEFT_PADDING = 10.0;
  static const double DESCRIPTION_VERTICAL_PADDING = 10.0;

  final String category;
  final String title;
  final int price;
  final String creatorName;
  final String description;

  GoodProfileLayout({
    Key key,
    @required this.category,
    @required this.title,
    @required this.price,
    @required this.creatorName,
    this.description,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat();

    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(category,
                    style: const TextStyle(
                      fontSize: CATEGORY_FONT_SIZE,
                      color: Colors.black54,
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: CATEGORY_TOP_PADDING,
                  ),
                ),
                Container(
                  child: Text(title,
                    style: const TextStyle(
                      fontSize: TITLE_FONT_SIZE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: TITLE_TOP_PADDING,
                  ),
                ),
                Container(
                  child: Text('${numberFormat.format(price)}원',
                    style: const TextStyle(
                      fontSize: PRICE_FONT_SIZE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: PRICE_VERTICAL_PADDING,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING,
            ),
          ),
          Divider(),
          Container(
            child: Row(
              children: [
                Container(
                  child: const CircleAvatar(
                    backgroundImage: const AssetImage(GOOD_IMAGE_PATH),
                    backgroundColor: Colors.transparent,
                    radius: CREATOR_IMAGE_RADIUS,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(creatorName,
                          style: TextStyle(
                            fontSize: CREATOR_NAME_SIZE,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      left: CREATOR_NAME_LEFT_PADDING,
                    ),
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING,
            ),
          ),
          Divider(),
          Container(
            child: Text(
              this.description ?? '',
              overflow: TextOverflow.ellipsis,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: DESCRIPTION_VERTICAL_PADDING,
              horizontal: HORIZONTAL_PADDING,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}