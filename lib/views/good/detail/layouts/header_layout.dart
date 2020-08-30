import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 10.0;

  final double height;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
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
        ],
      ),
      height: this.height,
    );
  }
}