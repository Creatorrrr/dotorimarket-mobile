import 'package:dotorimarket/views/good/detail/good_detail_page.dart';
import 'package:dotorimarket/views/good/list/widgets/tab_all_banner_image.dart';
import 'package:dotorimarket/views/good/list/widgets/tab_all_grid_item.dart';
import 'package:flutter/material.dart';

class TabAllLayout extends StatelessWidget {
  static const String ALL_BANNER_PATH = 'assets/dotori-banner.png';
  static const double LAYOUT_BANNER_TOP_PADDING = 10.0;
  static const double LAYOUT_BANNER_BOTTOM_PADDING = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabAllBannerImage(
              image: ALL_BANNER_PATH,
            ),
            padding: EdgeInsets.only(
              top: LAYOUT_BANNER_TOP_PADDING,
              bottom: LAYOUT_BANNER_BOTTOM_PADDING,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
                TabAllGridItem(
                  title: '바바파파시리즈 아동도서',
                  price: '40,000원',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (context) {
                          return GoodDetailPage();
                        }
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}