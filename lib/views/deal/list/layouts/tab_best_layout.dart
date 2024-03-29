import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/deal/list/widgets/deal_grid_item.dart';
import 'package:dotorimarket/views/deal/list/widgets/banner_image.dart';
import 'package:flutter/material.dart';

class TabBestLayout extends StatelessWidget {
  static const String ALL_BANNER_PATH = 'assets/images/dotori-banner.png';

  static const double HORIZONTAL_PADDING = 10.0;
  static const double LAYOUT_BANNER_TOP_PADDING = 10.0;
  static const double DEAL_GRID_TOP_PADDING = 10.0;
  static const int DEAL_GRID_CROSS_AXIS_COUNT = 2;
  static const double DEAL_GRID_MAIN_AXIS_SPACING = 10.0;
  static const double DEAL_GRID_CROSS_AXIS_SPACING = 10.0;
  static const double DEAL_GRID_CHILD_ASPECT_RATIO = 0.7;

  final List<DealDto> deals = [];

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: BannerImage(
              image: ALL_BANNER_PATH,
            ),
            padding: const EdgeInsets.only(
              top: LAYOUT_BANNER_TOP_PADDING,
            ),
          ),
          Expanded(
            child: Container(
              child: CheckedFutureBuilder(
                future: dealViewModel.getDealList("", "", "", "", "", context),
                builder: (BuildContext context, AsyncSnapshot<List<DealDto>> snapshot) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DEAL_GRID_CROSS_AXIS_COUNT,
                      mainAxisSpacing: DEAL_GRID_MAIN_AXIS_SPACING,
                      crossAxisSpacing: DEAL_GRID_CROSS_AXIS_SPACING,
                      childAspectRatio: DEAL_GRID_CHILD_ASPECT_RATIO,
                    ),
                    itemBuilder: (BuildContext context, int index) => DealGridItem(snapshot.data[index],
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (context) {
                              return DealDetailPage(snapshot.data[index].id);
                            }
                        ));
                      },
                    ),
                    itemCount: snapshot.data.length,
                  );
                },
              ),
              padding: const EdgeInsets.only(
                top: DEAL_GRID_TOP_PADDING,
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
