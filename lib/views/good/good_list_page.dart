import 'package:dotorimarket/views/good/widgets/body_layout.dart';
import 'package:dotorimarket/views/good/widgets/header_layout.dart';
import 'package:flutter/material.dart';

class GoodListPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/dotori-logo.png';
  static const double HEADER_TOP = 45.0;
  static const double PAGE_PADDING = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                HeaderLayout(
                  height: HEADER_TOP,
                  logoPath: HEADER_LOGO_PATH,
                ),
                Positioned(
                  top: HEADER_TOP,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: BodyLayout(),
                )
              ],
            ),
            padding: EdgeInsets.all(PAGE_PADDING),
          );
        },
      ),
    );
  }
}