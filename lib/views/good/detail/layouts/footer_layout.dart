import 'package:flutter/material.dart';

class FooterLayout extends StatelessWidget {
  static const String CHAT_BUTTON_TEXT = '채팅으로 거래하기';
  static const double HEIGHT_DEFAULT = 70.0;
  static const double PADDING_DEFAULT = 10.0;
  static const double CHAT_BUTTON_HEIGHT = 50.0;
  static const double CHAT_BUTTON_MIN_WIDTH = 150.0;
  static const double CHAT_BUTTON_BORDER_RADIUS = 5.0;

  final double height;
  final Function onSharePressed;
  final Function onFavoritePressed;
  final Function onEditPressed;
  final Function onChatPressed;

  FooterLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
    @required this.onSharePressed,
    @required this.onFavoritePressed,
    @required this.onEditPressed,
    @required this.onChatPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: this.onSharePressed,
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: this.onFavoritePressed,
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: this.onEditPressed,
            ),
          ),
          Expanded(
            child: Container(
              child: ButtonTheme(
                child: FlatButton(
                  child: Text(CHAT_BUTTON_TEXT),
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(CHAT_BUTTON_BORDER_RADIUS),
                  ),
                  onPressed: this.onChatPressed,
                ),
                height: CHAT_BUTTON_HEIGHT,
                minWidth: CHAT_BUTTON_MIN_WIDTH,
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
      height: this.height,
      padding: const EdgeInsets.all(PADDING_DEFAULT),
    );
  }
}