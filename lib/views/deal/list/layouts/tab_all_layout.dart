import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/deal/list/widgets/banner_image.dart';
import 'package:dotorimarket/views/deal/list/widgets/deal_grid_item.dart';
import 'package:flutter/material.dart';

class TabAllLayout extends StatelessWidget {
  static const String ALL_BANNER_PATH = 'assets/images/dotori-banner.png';

  static const double HORIZONTAL_PADDING = 15.0;
  static const double LAYOUT_BANNER_TOP_MARGIN = 10.0;
  static const double DEAL_GRID_TOP_MARGIN = 20.0;
  static const int DEAL_GRID_CROSS_AXIS_COUNT = 2;
  static const double DEAL_GRID_MAIN_AXIS_SPACING = 0.0;
  static const double DEAL_GRID_CROSS_AXIS_SPACING = 10.0;
  static const double DEAL_GRID_CHILD_ASPECT_RATIO = 0.7;

  final List<DealDto> dealList;
  final bool Function(ScrollNotification notification) onNotification;

  TabAllLayout(this.dealList, {
    Key key,
    @required this.onNotification,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: BannerImage(
              image: ALL_BANNER_PATH,
            ),
            margin: const EdgeInsets.only(
              top: LAYOUT_BANNER_TOP_MARGIN,
            ),
          ),
          Expanded(
            child: Container(
              child: NotificationListener<ScrollNotification>(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: DEAL_GRID_CROSS_AXIS_COUNT,
                    mainAxisSpacing: DEAL_GRID_MAIN_AXIS_SPACING,
                    crossAxisSpacing: DEAL_GRID_CROSS_AXIS_SPACING,
                    childAspectRatio: DEAL_GRID_CHILD_ASPECT_RATIO,
                  ),
                  itemBuilder: (BuildContext context, int index) => DealGridItem(
                    title: this.dealList[index].title ?? '',
                    price: this.dealList[index].price,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (context) {
                            return DealDetailPage(this.dealList[index].id);
                          }
                      ));
                    },
                  ),
                  itemCount: this.dealList.length,
                ),
                onNotification: onNotification,
              ),
              margin: const EdgeInsets.only(
                top: DEAL_GRID_TOP_MARGIN,
              ),
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
    );
  }
}
