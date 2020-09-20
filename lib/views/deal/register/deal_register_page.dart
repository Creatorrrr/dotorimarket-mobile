import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/register/layouts/body_layout.dart';
import 'package:dotorimarket/views/deal/register/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class DealRegisterPage extends StatelessWidget {
  static const double HEADER_TOP_HEIGHT = 50.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: GestureDetector(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return SafeArea(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: HeaderLayout(
                          height: HEADER_TOP_HEIGHT,
                        ),
                        height: HEADER_TOP_HEIGHT,
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                      ),
                      Positioned(
                        child: BodyLayout(),
                        top: HEADER_TOP_HEIGHT,
                        bottom: 0.0,
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
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
      viewModels: [
        CategoryViewModel(),
        DealViewModel(),
      ],
    );
  }
}
