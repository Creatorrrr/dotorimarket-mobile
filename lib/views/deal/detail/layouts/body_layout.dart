import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/detail/layouts/good_profile_layout.dart';
import 'package:dotorimarket/views/deal/detail/widgets/main_image.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  final int dealId;

  BodyLayout({
    Key key,
    @required this.dealId,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const String DEAL_TEMP_IMAGE_PATH = 'assets/images/dotori-banner.png';

  static const double DEAL_PROFILE_TOP_RADIUS = 30.0;

  int dealId;

  DealDto deal;

  /// state 초기화
  void _init() {
    dealId = widget.dealId;
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: MainImage(
              image: DEAL_TEMP_IMAGE_PATH,
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
                          child: FutureBuilder(
                            future: dealViewModel.getDealOne(dealId, context),
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
                                    category: '디지털/핸드폰 > 갤럭시 케이스',
                                    title: deal.title,
                                    price: deal.price,
                                    creatorName: '레코더팩토리',
                                    description: deal.description,
                                    scrollController: scrollController,
                                  );
                                default:
                                  return null;
                              }
                            },
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