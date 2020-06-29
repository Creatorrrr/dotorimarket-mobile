import 'package:flutter/material.dart';

class TabAllGridItem extends StatelessWidget {
  static const String GRID_LOGO_PATH = 'assets/dotori-grid-item.png';

  final String title;
  final String price;

  TabAllGridItem({
    Key key,
    @required this.title,
    @required this.price,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                GRID_LOGO_PATH,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}