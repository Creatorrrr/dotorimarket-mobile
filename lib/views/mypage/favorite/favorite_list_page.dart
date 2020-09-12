import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/mypage/favorite/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/favorite/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  static const String HEADER_TITLE = '관심목록';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (context) {
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
                        title: HEADER_TITLE,
                      ),
                    ),
                    Positioned(
                      top: HEADER_TOP_HEIGHT,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: BodyLayout(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      viewModel: DealViewModel(),
    );
  }
}