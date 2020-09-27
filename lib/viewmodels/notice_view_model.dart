import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
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

    // Response res = await HttpUtil.get(url, context,
    //   queryParams: queryParams,
    // );
    // Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<NoticeDto> categoryList = [
      NoticeDto(
        noticeId: 1,
        title: '디지털/가전',
        type: '서비스소식',
        time: '2020.08.11',
        content: 'ㅁ니ㅏㅇ럼닝ㄹㄴㅁㅇㄹㅁㄴㄹㅁㄴ\n\n\asena\sdsn\asn\d\n\n\n\n\n\n\n\n\n\n\\n\nn\gs\fn\gfdn\dfgn\fdgndf\\n\nnsan\dnnasdfas',
      ),
      NoticeDto(
        noticeId: 2,
        title: '디지털/가전',
        type: '서비스소식',
        time: '2020.08.11',
        content: 'ㅁ니ㅏㅇ럼닝ㄹㄴㅁㅇㄹㅁㄴㄹㅁㄴ\n\n\asena\sdsn\asn\dnsan\dnnasdfas',
      ),
      NoticeDto(
        noticeId: 3,
        title: '디지털/가전',
        type: '서비스소식',
        time: '2020.08.11',
        content: 'ㅁ니ㅏㅇ럼닝ㄹㄴㅁㅇㄹㅁㄴㄹㅁㄴ\n\n\asena\sdsn\asn\dnsan\dnnasdfas',
      ),
    ];
    // for (dynamic json in bodyJson['result']) {
    //   CategoryDto categoryDto = new CategoryDto.fromJson(json);
    //   categoryList.add(categoryDto);
    // }

    return categoryList;
  }
}