import 'package:dotorimarket/views/mypage/main/widgets/my_page_circle_button.dart';
import 'package:flutter/cupertino.dart';

class MyProfileLayout extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 100.0;

  static const String SALE_LIST_BUTTON_TEXT = '판매내역';
  static const String PURCHASE_LIST_BUTTON_TEXT = '구매내역';
  static const String FAVORITE_LIST_BUTTON_TEXT = '관심목록';

  final String name;
  final String description;
  final double height;

  MyProfileLayout({
    Key key,
    @required this.name,
    this.description,
    this.height = HEIGHT_DEFAULT,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              THUMBNAIL_PATH,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text(
                    this.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 0.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text(
                    this.description ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 0.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
        ],
      ),
      height: this.height,
    );
  }
}