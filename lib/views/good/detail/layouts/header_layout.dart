import 'package:dotorimarket/views/common/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderLayout extends StatelessWidget {
  static const double HEADER_TOP_HEIGHT_DEFAULT = 50.0;
  static const double HEADER_TEXT_SIZE = 16.0;

  static const String HEADER_TEXT = '상품상세';

  final double height;

  HeaderLayout({
    Key key,
    this.height = HEADER_TOP_HEIGHT_DEFAULT,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              child: const Text(HEADER_TEXT,
                style: const TextStyle(
                  fontSize: HEADER_TEXT_SIZE,
                  fontWeight: FontWeight.bold,
                ),
              ),
              alignment: Alignment.center,
              height: this.height,
            ),
          ),
          Positioned(
            child: HeaderIconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}