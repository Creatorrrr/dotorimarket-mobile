import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 10.0;

  static const String HEADER_HINT_TEXT = '어떤 상품이 궁금하세요?';

  final double height;
  final TextEditingController controller;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
    @required this.controller,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          Expanded(
            child: Container(
              child: TextField(
                controller: this.controller,
                decoration: InputDecoration(
                  hintText: HEADER_HINT_TEXT,
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10.0),
                ),
              )
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.search),
              onPressed: () {

              },
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HEADER_ROW_PADDING,
            ),
          ),
        ],
      ),
      height: this.height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}