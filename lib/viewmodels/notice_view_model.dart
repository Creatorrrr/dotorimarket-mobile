import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/notice/notice_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';

class NoticeViewModel extends ViewModel {
  static const GET_NOTICE_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/notices';

  Future<List<NoticeDto>> getNoticeList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_NOTICE_LIST;

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

    List<NoticeDto> noticeList = [];
    Map<String, dynamic> bodyJson = jsonDecode(res.body);
    for (dynamic json in bodyJson['result']) {
      NoticeDto noticeDto = new NoticeDto.fromJson(json);
      noticeList.add(noticeDto);
    }

    return noticeList;
  }
}