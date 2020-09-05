import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/view_model.dart';

class DealViewModel extends ViewModel {
  static const POST_DEAL = '${HttpConfig.URL_PREFIX}/v1/deals';
  static const GET_DEAL_LIST = '${HttpConfig.URL_PREFIX}/v1/deals';

  final BuildContext context;

  DealViewModel(
    this.context,
  );

  Future<Response> postDeal(DealPostDto dealPostDto) async {
    Response res = await HttpUtil.post(
      POST_DEAL,
      context,
      body: dealPostDto.toJson(),
    );
    return res;
  }

  Future<List<DealDto>> getDealList(String filter, String field, String keyword, String orders, String paging) async {
    String url = GET_DEAL_LIST;

    Map<String, String> queryParams = {
      filter: filter,
      field: field,
      keyword: keyword,
      orders: orders,
      paging: paging,
    };

    Response res = await HttpUtil.get(url, context,
      queryParams: queryParams,
    );
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<DealDto> dealList = [];
    for (dynamic json in bodyJson['result']) {
      DealDto dealDto = new DealDto.fromJson(json);
      dealList.add(dealDto);
    }

    return dealList;
  }
}