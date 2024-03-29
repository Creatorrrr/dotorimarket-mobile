import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_patch_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/deal/detail/deal_detail_page.dart';
import 'package:dotorimarket/views/deal/modify/deal_modify_page.dart';
import 'package:dotorimarket/views/mypage/sell/sell_list_page.dart';
import 'package:dotorimarket/views/mypage/sell/widgets/sell_selling_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TabSellingLayout extends StatefulWidget {
  final SharedPreferences prefs;

  TabSellingLayout(this.prefs, {
    Key key,
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _TabSellingLayoutState();
}

class _TabSellingLayoutState extends State<TabSellingLayout> {
  static const String ALL_BANNER_PATH = 'assets/images/dotori-banner.png';
  static const double LAYOUT_BANNER_TOP_PADDING = 10.0;
  static const double LAYOUT_BANNER_BOTTOM_PADDING = 5.0;

  int skip = 0;
  int limit = 10;
  bool hasMore = true;
  bool requested = false;

  @override
  Widget build(BuildContext context) {
    final String userId = widget.prefs.getString('id');
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    String filter = jsonEncode({
      'seller': userId,
      'status': 'S',
    });

    String orders = jsonEncode({
      'createdAt': 'desc',
    });

    return CheckedFutureBuilder(
      future: dealViewModel.getDealList(filter, '', '', orders, '', context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List<DealDto> dealList = snapshot.data;

        return Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return SellSellingListItem(dealList[index],
                      onItemPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (context) {
                            return DealDetailPage(dealList[index].id);
                          }
                        ));
                      },
                      onModifyPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (context) {
                              return DealModifyPage(dealList[index].id);
                            }
                        ));
                      },
                      onDeletePressed: () async {
                        http.Response res = await dealViewModel.deleteDeal(dealList[index].id, context);
                        if (res.statusCode == HttpStatus.ok) {
                          Navigator.pushReplacement(context, PageRouteBuilder(
                            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                            => SellListPage(),
                          ));
                        } else {
                          Scaffold.of(context).removeCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('삭제실패')));
                        }
                      },
                      onToReservingPressed: () async {
                        try {
                          DealPatchDto dealPatchDto = DealPatchDto(
                            status: 'R',
                          );
                          Response res = await dealViewModel.patchDeal(dealList[index].id, dealPatchDto, null, context);

                          // 성공여부 확인
                          if (res.statusCode == HttpStatus.ok) {
                            setState(() {});
                          } else {
                            Map<String, dynamic> bodyJson = jsonDecode(res.data);
                            String message = bodyJson['message'];

                            Scaffold.of(context).removeCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));  // 서버 메시지 출력
                          }
                        } catch (err) {
                          print(err);
                          Scaffold.of(context).removeCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
                        }
                      },
                      onToFinishedPressed: () async {
                        try {
                          DealPatchDto dealPatchDto = DealPatchDto(
                            status: 'F',
                          );
                          Response res = await dealViewModel.patchDeal(dealList[index].id, dealPatchDto, null, context);

                          // 성공여부 확인
                          if (res.statusCode == HttpStatus.ok) {
                            setState(() {});
                          } else {
                            Map<String, dynamic> bodyJson = jsonDecode(res.data);
                            String message = bodyJson['message'];

                            Scaffold.of(context).removeCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));  // 서버 메시지 출력
                          }
                        } catch (err) {
                          print(err);
                          Scaffold.of(context).removeCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
                        }
                      },
                    );
                  },
                  itemCount: dealList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}