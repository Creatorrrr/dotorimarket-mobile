import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/detail/layouts/body_layout.dart';
import 'package:dotorimarket/views/deal/detail/layouts/footer_layout.dart';
import 'package:dotorimarket/views/deal/detail/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class DealDetailPage extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_HEIGHT = 50.0;
  static const double BOTTOM_HEIGHT = 60.0;

  final int dealId;

  DealDetailPage(this.dealId, {
    Key key,
  }):super(key: key);

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
                        child: BodyLayout(dealId),
                        top: HEADER_HEIGHT,
                        bottom: BOTTOM_HEIGHT,
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
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
        backgroundColor: Colors.white,
      ),
      viewModel: DealViewModel(),
    );
  }
}