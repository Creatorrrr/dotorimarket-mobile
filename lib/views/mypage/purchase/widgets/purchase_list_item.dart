import 'package:flutter/material.dart';

class PurchaseListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';
  static const double HEIGHT_DEFAULT = 80.0;

  final String title;
  final String price;
  final double height;
  final Function onItemPressed;
  final Function onFavoritePressed;

  PurchaseListItem({
    Key key,
    @required this.title,
    @required this.price,
    this.height = HEIGHT_DEFAULT,
    @required this.onItemPressed,
    @required this.onFavoritePressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: ClipRRect(
              child: Image.asset(
                THUMBNAIL_PATH,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          Expanded(
            child: Column(
              children: [
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
                    bottom: 0.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  alignment: Alignment.centerLeft,
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
          Container(
            child: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: this.onFavoritePressed,
            ),
            alignment: Alignment.topCenter,
            width: 70.0,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      height: this.height,
    );
  }
}