import 'package:dotorimarket/views/category/widgets/category_list_item.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.8,
        children: <Widget>[
          CategoryListItem(
            title: '가전',
          ),
          CategoryListItem(
            title: '식품',
          ),
          CategoryListItem(
            title: '생활용품',
          ),
          CategoryListItem(
            title: '도서',
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
    );
  }
}