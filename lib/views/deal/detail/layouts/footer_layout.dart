import 'package:dotorimarket/views/deal/detail/widgets/chat_button.dart';
import 'package:flutter/material.dart';

class FooterLayout extends StatefulWidget {
  static const double HEIGHT_DEFAULT = 70.0;

  final double height;

  FooterLayout({
    Key key,
    this.height = HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _FooterLayoutState();
}

class _FooterLayoutState extends State<FooterLayout> {
  static const double PADDING_DEFAULT = 10.0;
  static const double CHAT_BUTTON_LEFT_PADDING = 5.0;

  double height;

  bool favorite;

  /// state 초기화
  void _init() {
    height = widget.height;
    favorite = false;
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.favorite,
                color: favorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  favorite = !favorite;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child: ChatButton(
                onPressed: () {

                },
              ),
              padding: const EdgeInsets.only(
                left: CHAT_BUTTON_LEFT_PADDING,
              ),
            ),
          ),
        ],
      ),
      height: this.height,
      padding: const EdgeInsets.all(PADDING_DEFAULT),
    );
  }
}