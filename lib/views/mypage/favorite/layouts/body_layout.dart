import 'package:dotorimarket/views/mypage/favorite/widgets/favorite_list_item.dart';
import 'package:dotorimarket/views/good/detail/good_detail_page.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            child: FavoriteListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              favorite: true,
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return GoodDetailPage();
                    }
                ));
              },
              onFavoritePressed: (bool favorite) {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            child: FavoriteListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return GoodDetailPage();
                    }
                ));
              },
              onFavoritePressed: (bool favorite) {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            child: FavoriteListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return GoodDetailPage();
                    }
                ));
              },
              onFavoritePressed: (bool favorite) {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}