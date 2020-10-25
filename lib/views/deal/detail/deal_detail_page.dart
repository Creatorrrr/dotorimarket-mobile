import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/chat_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/layouts/body_layout.dart';
import 'package:dotorimarket/views/deal/detail/layouts/footer_layout.dart';
import 'package:dotorimarket/views/deal/detail/layouts/header_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DealDetailPage extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/images/dotori-logo.png';

  static const double HEADER_HEIGHT = 50.0;
  static const double FOOTER_HEIGHT = 60.0;

  final String dealId;

  DealDetailPage(this.dealId, {
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

            return CheckedFutureBuilder(
              future: Future.wait([
                SharedPreferences.getInstance(),
                dealViewModel.getDealOne(this.dealId, context),
              ]),
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                SharedPreferences prefs = snapshot.data[0];
                DealDto deal = snapshot.data[1];

                return SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: BodyLayout(deal, prefs),
                          top: HEADER_HEIGHT,
                          bottom: FOOTER_HEIGHT,
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
                          height: FOOTER_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: FooterLayout(deal, prefs,
                            height: FOOTER_HEIGHT,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      viewModels: <ViewModel>[
        DealViewModel(),
        ChatViewModel(),
      ],
    );
  }
}