import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoodProfileLayout extends StatelessWidget {
  final String title;
  final int price;
  final String description;

  GoodProfileLayout({
    Key key,
    @required this.title,
    @required this.price,
    this.description,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat();

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  this.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  numberFormat.format(this.price) + '원',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerRight,
                width: 100.0,
              ),
            ],
          ),
          Container(
            child: Text(
              this.description ?? '',
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}