import 'package:dotorimarket/views/setting/layouts/body_layout.dart';
import 'package:dotorimarket/views/setting/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  static const double HEADER_HEIGHT = 50.0;
  static const double BOTTOM_HEIGHT = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: BodyLayout(),
                    top: HEADER_HEIGHT,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                  ),
                  Positioned(
                    child: HeaderLayout(
                      height: HEADER_HEIGHT,
                    ),
                    height: HEADER_HEIGHT,
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}