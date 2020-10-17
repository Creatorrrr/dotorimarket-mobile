import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/faq/faq_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';

class FaqViewModel extends ViewModel {
  static const GET_FAQ_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/faqs';

  Future<List<FaqDto>> getFaqList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_FAQ_LIST;

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

    List<FaqDto> faqList = [];
    for (dynamic json in bodyJson['result']) {
      FaqDto aqDto = new FaqDto.fromJson(json);
      faqList.add(aqDto);
    }

    return faqList;
  }
}