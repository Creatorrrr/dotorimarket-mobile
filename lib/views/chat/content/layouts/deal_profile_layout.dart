import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealProfileLayout extends StatelessWidget {
  static const double DEAL_PROFILE_IMAGE_SIZE = 70.0;
  static const double DEAL_PROFILE_IMAGE_BORDER_RADIUS = 5.0;
  static const double DEAL_PROFILE_VERTICAL_PADDING = 15.0;
  static const double DEAL_PROFILE_HORIZONTAL_PADDING = 15.0;
  static const double DEAL_PROFILE_TEXT_LEFT_MARGIN = 15.0;
  static const double DEAL_PROFILE_STATUS_FONT_SIZE = 16.0;
  static const double DEAL_PROFILE_NAME_FONT_SIZE = 16.0;
  static const double DEAL_PROFILE_NAME_LEFT_MARGIN = 5.0;
  static const double DEAL_PROFILE_PRICE_FONT_SIZE = 16.0;
  static const double DEAL_PROFILE_PRICE_TOP_MARGIN = 5.0;

  final Image image;
  final String status;
  final String name;
  final int price;

  DealProfileLayout({
    Key key,
    this.image,
    this.status,
    this.name,
    this.price,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat();

    return Container(
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              child: image,
              borderRadius: BorderRadius.circular(DEAL_PROFILE_IMAGE_BORDER_RADIUS),
            ),
            height: DEAL_PROFILE_IMAGE_SIZE,
            width: DEAL_PROFILE_IMAGE_SIZE,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('[$status]',
                          style: const TextStyle(
                            fontSize: DEAL_PROFILE_STATUS_FONT_SIZE,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(name,
                          style: const TextStyle(
                            fontSize: DEAL_PROFILE_NAME_FONT_SIZE,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: const EdgeInsets.only(
                          left: DEAL_PROFILE_NAME_LEFT_MARGIN,
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Text('${numberFormat.format(price)}원',
                      style: const TextStyle(
                        fontSize: DEAL_PROFILE_PRICE_FONT_SIZE,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      top: DEAL_PROFILE_PRICE_TOP_MARGIN,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: const EdgeInsets.only(
                left: DEAL_PROFILE_TEXT_LEFT_MARGIN,
              ),
            ),
          )
        ],
      ),
    );
  }
}