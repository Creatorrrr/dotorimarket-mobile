import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/layouts/good_profile_layout.dart';
import 'package:dotorimarket/views/deal/detail/widgets/main_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatefulWidget {
  final DealDto deal;
  final SharedPreferences prefs;

  BodyLayout(this.deal, this.prefs, {
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const double DEAL_PROFILE_TOP_RADIUS = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return MainImage(
                  image: Image.network('${HttpConfig.URL_PREFIX}/${widget.deal.imgs[index].path}',
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: widget.deal.imgs.length,
              pagination: SwiperPagination(
                alignment: Alignment.center,
              ),
              loop: false,
            ),
          ),
          Positioned(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final goodProfileHeight = constraints.maxHeight - constraints.maxWidth + DEAL_PROFILE_TOP_RADIUS;
                final goodProfileMaxHeight = constraints.maxHeight - constraints.maxWidth / 2 + DEAL_PROFILE_TOP_RADIUS;
                final double goodProfileInitialChildSize = goodProfileHeight / constraints.maxHeight;
                final double goodProfileMaxChildSize = goodProfileMaxHeight / constraints.maxHeight;

                return DraggableScrollableSheet(
                  initialChildSize: goodProfileInitialChildSize,
                  minChildSize: goodProfileInitialChildSize,
                  maxChildSize: goodProfileMaxChildSize,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          child: GoodProfileLayout(widget.deal,
                            scrollController: scrollController,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(
                              top: const Radius.circular(DEAL_PROFILE_TOP_RADIUS)
                            ),
                          ),
                          height: goodProfileMaxHeight,
                        ),
                        physics: ClampingScrollPhysics(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}