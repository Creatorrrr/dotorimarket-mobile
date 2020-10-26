import 'dart:convert';

import 'package:async/async.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/mypage/sell/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/sell/layouts/header_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SellListPageState();
}

class _SellListPageState extends State<SellListPage> {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  int skip = 0;
  int limit = 10;
  bool hasMore = true;
  bool requested = false;

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return CheckedFutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                final String userId = snapshot.data.getString('id');
                final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

                String filter = jsonEncode({
                  'seller': userId,
                });

                String orders = jsonEncode({
                  'createdAt': 'desc',
                });

                return CheckedFutureBuilder(
                  future: _memoizer.runOnce(() => dealViewModel.getDealList(filter, '', '', orders, '', context)),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    List<DealDto> dealList = snapshot.data;

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
                              child: BodyLayout(dealList),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      viewModels: [
        DealViewModel(),
      ],
    );
  }
}