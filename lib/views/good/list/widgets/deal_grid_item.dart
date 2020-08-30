import 'package:flutter/material.dart';

class DealGridItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';

  final String title;
  final String price;
  final Function onPressed;

  DealGridItem({
    Key key,
    @required this.title,
    @required this.price,
    @required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                child: Image.asset(
                  THUMBNAIL_PATH,
                  fit: BoxFit.cover,
                ),
                aspectRatio: 1.0,
              ),
            ),
            Container(
              child: Text(
                this.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Container(
              child: Text(
                this.price,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(
                top: 5.0,
              ),
            ),
          ],
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}