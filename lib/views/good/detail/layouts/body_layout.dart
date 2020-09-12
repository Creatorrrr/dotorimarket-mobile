import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/detail/layouts/good_profile_layout.dart';
import 'package:dotorimarket/views/good/detail/widgets/main_image.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatefulWidget {
  final int dealId;

  BodyLayout(this.dealId, {
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLayoutState(dealId);
}

class _BodyLayoutState extends State<BodyLayout> {
  static const String DEAL_TEMP_IMAGE_PATH = 'assets/images/dotori-banner.png';

  static const double DEAL_PROFILE_TOP_RADIUS = 30.0;

  final int dealId;

  ScrollController _scrollController;

  DealDto deal;

  _BodyLayoutState(this.dealId);

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(DEAL_PROFILE_TOP_RADIUS * 2);
    });
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
            child: Container(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width,
                  ),
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
                          return ConstrainedBox(
                            child: GoodProfileLayout(
                              category: '디지털/핸드폰 > 갤럭시 케이스',
                              title: deal.title,
                              price: deal.price,
                              creatorName: '레코더팩토리',
                              description: deal.description,
                            ),
                            constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).size.width,
                            ),
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
                ),
                physics: ClampingScrollPhysics(),
              ),
            ),
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
          ),
        ],
      ),
    );
  }
}