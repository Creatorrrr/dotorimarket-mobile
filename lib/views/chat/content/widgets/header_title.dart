import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  static const double HEIGHT_DEFAULT = double.infinity;
  static const double ICON_SIZE_DEFAULT = 24.0;

  final double height;
  final String title;
  final double time;

  HeaderTitle({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.title,
    @required this.time,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.priority_high,
                size: 16.0,
                color: Colors.green,
              ),
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Last Active: ${this.time} sec',
            style: TextStyle(
              fontSize: 11.0,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: this.height,
    );
  }
}