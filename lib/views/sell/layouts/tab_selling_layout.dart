import 'package:dotorimarket/views/sell/widgets/sell_list_item.dart';
import 'package:flutter/material.dart';

class TabSellingLayout extends StatelessWidget {
  static const String ALL_BANNER_PATH = 'assets/dotori-banner.png';
  static const double LAYOUT_BANNER_TOP_PADDING = 10.0;
  static const double LAYOUT_BANNER_BOTTOM_PADDING = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: SellListItem(
                    title: '바바파파시리즈 아동도서',
                    price: '40,000원',
//                    onPressed: () {
//                      Navigator.push(context, MaterialPageRoute<void>(
//                          builder: (context) {
//                            return GoodDetailPage();
//                          }
//                      ));
//                    },
                  ),
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}