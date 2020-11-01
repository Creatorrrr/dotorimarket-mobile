import 'dart:convert';

import 'package:async/async.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/menu_layout.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/list/layouts/category_header_layout.dart';
import 'package:dotorimarket/views/deal/list/layouts/header_layout.dart';
import 'package:dotorimarket/views/deal/list/layouts/tab_all_layout.dart';
import 'package:flutter/material.dart';

class DealListPage extends StatefulWidget {
  final String categoryId;

  DealListPage({
    Key key,
    this.categoryId,
  }):super(key: key);

   @override
  State<StatefulWidget> createState() => _DealListPageState();
}

class _DealListPageState extends State<DealListPage> {
  static const String HEADER_LOGO_PATH = 'assets/images/dotori-logo.png';

  static const double HEADER_TOP_HEIGHT = 50.0;
  static const double TAB_BOTTOM_HEIGHT = 50.0;

  List<DealDto> dealList;
  String filter = '';
  String orders = jsonEncode({
    'createdAt': 'desc',
  });
  int skip = 0;
  int limit = 10;
  bool hasMore = true;
  bool requested = false;

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    if (StringUtil.isNotEmpty(widget.categoryId)) {
      filter = jsonEncode({
        'category': widget.categoryId,
      });
    }

    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            final CategoryViewModel categoryViewModel = ViewModelProvider.of<CategoryViewModel>(context);
            final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);
            String paging = jsonEncode({
              'skip': skip,
              'limit': limit,
            });

            List<Future<dynamic>> futures = [
              dealViewModel.getDealList(filter, '', '', orders, paging, context),
            ];
            if (StringUtil.isNotEmpty(widget.categoryId)) futures.add(categoryViewModel.getCategoryOne(widget.categoryId, context));

            return CheckedFutureBuilder(
              future: _memoizer.runOnce(() => Future.wait(futures)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (dealList == null) {
                  dealList = snapshot.data[0];
                  skip += limit;
                  if (dealList.length < limit) hasMore = false;
                }
                CategoryDto category = StringUtil.isNotEmpty(widget.categoryId) ? snapshot.data[1] : null;

                return SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        StringUtil.isNotEmpty(widget.categoryId)
                        ? Positioned(
                            height: HEADER_TOP_HEIGHT,
                            top: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: CategoryHeaderLayout(
                              height: HEADER_TOP_HEIGHT,
                              text: category.name,
                            ),
                          )
                        : Positioned(
                            height: HEADER_TOP_HEIGHT,
                            top: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: HeaderLayout(
                              height: HEADER_TOP_HEIGHT,
                              logoPath: HEADER_LOGO_PATH,
                            ),
                          ),
                        Positioned(
                          top: HEADER_TOP_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: TabAllLayout(dealList,
                            onNotification: (ScrollNotification notification) {
                              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                                loadMore(context);
                              }
                              return true;
                            },
                          ),
                        ),
                        Positioned(
                          height: TAB_BOTTOM_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: MenuLayout(
                            height: TAB_BOTTOM_HEIGHT,
                          ),
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
        CategoryViewModel(),
        DealViewModel(),
      ],
    );
  }

  /// 추가 로딩
  void loadMore(BuildContext context) async {
    if (hasMore && !requested) {
      requested = true;
      final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);
      String paging = jsonEncode({
        'skip': skip,
        'limit': limit,
      });
      List<DealDto> loaded = await dealViewModel.getDealList(filter, '', '', orders, paging, context);
      setState(() {
        dealList.addAll(loaded);
        skip += limit;
        if (loaded.length < limit) hasMore = false;
        requested = false;
      });
    }
  }
}