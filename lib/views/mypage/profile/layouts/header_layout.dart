import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:dotorimarket/views/setting/setting_page.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_ROW_PADDING = 10.0;

  static const String HEADER_TITLE_TEXT = '프로필';

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
          Expanded(
            child: Container(
              child: Text(
                HEADER_TITLE_TEXT,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height: this.height,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
            ),
          ),
          Container(
            child: HeaderIconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return SettingPage();
                    }
                ));
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