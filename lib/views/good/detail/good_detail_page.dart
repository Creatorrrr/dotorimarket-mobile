import 'package:dotorimarket/views/good/detail/layouts/body_layout.dart';
import 'package:dotorimarket/views/good/detail/layouts/footer_layout.dart';
import 'package:dotorimarket/views/good/detail/layouts/header_layout.dart';
import 'package:dotorimarket/views/good/modify/good_modify_page.dart';
import 'package:flutter/material.dart';

class GoodDetailPage extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/dotori-logo.png';
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
                    top: 0.0,
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
                  Positioned(
                    height: BOTTOM_HEIGHT,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: FooterLayout(
                      height: BOTTOM_HEIGHT,
                      onSharePressed: () {

                      },
                      onFavoritePressed: () {

                      },
                      onEditPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (context) {
                              return GoodModifyPage();
                            }
                        ));
                      },
                      onChatPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}