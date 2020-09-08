import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/detail/good_detail_page.dart';
import 'package:dotorimarket/views/good/list/widgets/deal_grid_item.dart';
import 'package:dotorimarket/views/good/list/widgets/tab_all_banner_image.dart';
import 'package:dotorimarket/views/good/list/widgets/tab_best_list_item.dart';
import 'package:flutter/material.dart';

class TabBestLayout extends StatelessWidget {
  static const String ALL_BANNER_PATH = 'assets/dotori-banner.png';
  static const double LAYOUT_BANNER_TOP_PADDING = 10.0;
  static const double LAYOUT_BANNER_BOTTOM_PADDING = 5.0;

  final List<DealDto> deals = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TabAllBannerImage(
              image: ALL_BANNER_PATH,
            ),
            padding: EdgeInsets.only(
              top: LAYOUT_BANNER_TOP_PADDING,
              bottom: LAYOUT_BANNER_BOTTOM_PADDING,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ViewModelProvider.of<DealViewModel>(context).getDealList("", "", "", "", ""),
              builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
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

                    // 데이터가 존재할 경우에만 세팅
                    if (snapshot.data != null && snapshot.data.length > 0) {
                      this.deals.clear();
                      this.deals.addAll(snapshot.data);
                    }

                    // 위젯 리스트 그리기
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) => DealGridItem(
                        title: deals[index].title ?? '',
                        price: deals[index].price ?? '',
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                              builder: (context) {
                                return GoodDetailPage(deals[index].dealId);
                              }
                          ));
                        },
                      ),
                      itemCount: deals.length,
                    );
                  default:
                    return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}