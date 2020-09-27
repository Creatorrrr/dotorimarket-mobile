import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfileLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double IMAGE_RADIUS = 40.0;
  static const double NAME_FONT_SIZE = 20.0;
  static const double DESCRIPTION_FONT_SIZE = 16.0;
  static const double DESCRIPTION_TOP_MARGIN = 5.0;
  static const double TEXT_LEFT_MARGIN = 15.0;

  static const String SALE_LIST_BUTTON_TEXT = '판매내역';
  static const String PURCHASE_LIST_BUTTON_TEXT = '구매내역';
  static const String FAVORITE_LIST_BUTTON_TEXT = '관심목록';

  final ImageProvider image;
  final String name;
  final String description;

  MyProfileLayout({
    Key key,
    this.image,
    @required this.name,
    this.description = '',
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: image,
            radius: IMAGE_RADIUS,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Text(name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: NAME_FONT_SIZE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(description,
                      style: const TextStyle(
                        fontSize: DESCRIPTION_FONT_SIZE,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      top: DESCRIPTION_TOP_MARGIN,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: const EdgeInsets.only(
                left: TEXT_LEFT_MARGIN,
              ),
            ),
          ),
        ],
      ),
    );
  }
}