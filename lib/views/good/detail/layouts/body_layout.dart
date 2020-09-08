import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/detail/layouts/good_profile_layout.dart';
import 'package:dotorimarket/views/good/detail/layouts/my_profile_layout.dart';
import 'package:dotorimarket/views/good/detail/widgets/main_image.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/dotori-logo.png';
  static const double GOOD_PROFILE_VERTICAL_PADDING = 15.0;
  static const double GOOD_PROFILE_HORIZONTAL_PADDING = 15.0;

  final int dealId;

  DealDto deal;

  BodyLayout(this.dealId, {
    Key key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MainImage(
            image: GOOD_IMAGE_PATH,
          ),
          Divider(
            height: 0,
          ),
          Container(
            child: FutureBuilder(
              future: ViewModelProvider.of<DealViewModel>(context).getDealOne(dealId),
              builder: (BuildContext context, AsyncSnapshot<DealDto> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Text('Awaiting result...'),
                    );
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    // 에러 발생 시 에러메시지 표시
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    // 결과값이 없을 경우 에러메시지 표시
                    if (snapshot.data == null) {
                      return Center(
                        child: Text('Error: 데이터가 없습니다'),
                      );
                    }

                    // 데이터 세팅
                    deal = snapshot.data;

                    // 위젯 리스트 그리기
                    return GoodProfileLayout(
                      title: deal.title,
                      price: deal.price,
                      description: deal.description,
                    );
                  default:
                    return null;
                }
              },
            ),
            padding: const EdgeInsets.symmetric(
              vertical: GOOD_PROFILE_VERTICAL_PADDING,
              horizontal: GOOD_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            child: MyProfileLayout(
              name: '을지로짱',
              description: '친절해요',
            ),
            padding: const EdgeInsets.symmetric(
              vertical: GOOD_PROFILE_VERTICAL_PADDING,
              horizontal: GOOD_PROFILE_HORIZONTAL_PADDING,
            ),
          ),
          Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}