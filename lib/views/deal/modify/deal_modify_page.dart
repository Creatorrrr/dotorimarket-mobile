import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/modify/layouts/body_layout.dart';
import 'package:dotorimarket/views/deal/modify/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class DealModifyPage extends StatelessWidget {
  static const double HEADER_TOP_HEIGHT = 50.0;

  final String dealId;

  DealModifyPage(this.dealId, {
    Key key
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: GestureDetector(
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

              return CheckedFutureBuilder(
                future: dealViewModel.getDealOne(dealId, context),
                builder: (BuildContext context, AsyncSnapshot<DealDto> snapshot) {
                  final DealDto deal = snapshot.data;

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
                            child: BodyLayout(deal),
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
