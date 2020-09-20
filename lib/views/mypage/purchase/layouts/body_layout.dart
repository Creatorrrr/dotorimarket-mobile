import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/mypage/purchase/widgets/purchase_list_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            child: PurchaseListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return DealDetailPage(
                        dealId: 1,
                      );
                    }
                ));
              },
              onFavoritePressed: () {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            child: PurchaseListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return DealDetailPage(
                        dealId: 1,
                      );
                    }
                ));
              },
              onFavoritePressed: () {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            child: PurchaseListItem(
              title: '바바파파시리즈 아동도서',
              price: '40,000원',
              onItemPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return DealDetailPage(
                        dealId: 1,
                      );
                    }
                ));
              },
              onFavoritePressed: () {

              },
            ),
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}