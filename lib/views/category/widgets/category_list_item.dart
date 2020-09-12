import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  static const String THUMBNAIL_PATH = 'assets/images/dotori-grid-item.png';

  final String title;

  CategoryListItem({
    Key key,
    @required this.title,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                THUMBNAIL_PATH,
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
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: 10.0,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}