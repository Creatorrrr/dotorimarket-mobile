import 'package:flutter/material.dart';

class NoticeListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 60.0;

  final String time;
  final String title;
  final double height;
  final Function onTab;

  NoticeListItem({
    Key key,
    @required this.time,
    @required this.title,
    this.height = HEIGHT_DEFAULT,
    @required this.onTab,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                this.time,
                style: TextStyle(
                  fontSize: 12.0,
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
                this.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
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
        height: this.height,
      ),
      onTap: this.onTab,
    );
  }
}