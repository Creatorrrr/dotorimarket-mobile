import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/mypage/favorite/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/favorite/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';
  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

            return CheckedFutureBuilder(
              future: dealViewModel.getFavoriteList(context),
              builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
                List<DealDto> dealList = snapshot.data;

                return SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
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
                          child: BodyLayout(dealList,
                            onItemPressed: (int index) {
                              Navigator.push(context, MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return DealDetailPage(dealList[index].id);
                                  }
                              ));
                            },
                            onFavoritePressed: (bool favorite, int index) {
                              dealViewModel.postFavorite(dealList[index].id, context);
                            },
                          ),
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