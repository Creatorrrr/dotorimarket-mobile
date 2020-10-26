import 'package:dotorimarket/views/common/menu_layout.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/mypage/main/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/main/layouts/header_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPagePage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return CheckedFutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
              SharedPreferences prefs = snapshot.data;

              return SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        height: HEADER_TOP_HEIGHT,
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: HeaderLayout(
                          height: HEADER_TOP_HEIGHT,
                        ),
                      ),
                      Positioned(
                        top: HEADER_TOP_HEIGHT,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: BodyLayout(prefs),
                      ),
                      Positioned(
                        height: TAB_BOTTOM_HEIGHT,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: MenuLayout(
                          height: TAB_BOTTOM_HEIGHT,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}