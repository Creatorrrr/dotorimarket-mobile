
import 'package:dotorimarket/viewmodels/notice_view_model.dart';
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/faq/list/layouts/body_layout.dart';
import 'package:dotorimarket/views/faq/list/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class FaqListPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

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
                      child: HeaderLayout(),
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
        backgroundColor: Colors.white,
      ),
      viewModels: <ViewModel>[
        NoticeViewModel(),
      ],
    );
  }
}