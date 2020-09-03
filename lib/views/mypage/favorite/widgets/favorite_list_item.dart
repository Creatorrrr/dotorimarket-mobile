import 'package:flutter/material.dart';

class FavoriteListItem extends StatefulWidget {
  static const bool FAVORITE_DEFAULT = false;
  static const double HEIGHT_DEFAULT = 80.0;

  final String title;
  final String price;
  final bool favorite;
  final double height;
  final Function onItemPressed;
  final Function(bool favorite) onFavoritePressed;

  FavoriteListItem({
    Key key,
    @required this.title,
    @required this.price,
    this.favorite = FAVORITE_DEFAULT,
    this.height = HEIGHT_DEFAULT,
    @required this.onItemPressed,
    @required this.onFavoritePressed,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => FavoriteListItemState(
    title: this.title,
    price: this.price,
    favorite: this.favorite,
    height: this.height,
    onItemPressed: this.onItemPressed,
    onFavoritePressed: this.onFavoritePressed,
  );
}

class FavoriteListItemState extends State<FavoriteListItem> {
  static const String THUMBNAIL_PATH = 'assets/dotori-grid-item.png';

  String title;
  String price;
  bool favorite;
  double height;
  Function onItemPressed;
  Function(bool favorite) onFavoritePressed;

  FavoriteListItemState({
    this.title,
    this.price,
    this.favorite,
    this.height,
    this.onItemPressed,
    this.onFavoritePressed,
  });

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
              icon: Icon(Icons.favorite),
              color: favorite ? Colors.red : Colors.black45,
              onPressed: () {
                setState(() {
                  favorite = !favorite;
                  this.onFavoritePressed(favorite);
                });
              },
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