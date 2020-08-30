import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/view_model.dart';

class DealViewModel extends ViewModel {
  static const POST_DEAL = '${HttpConfig.URL_PREFIX}/v1/deals';
  static const GET_DEAL_LIST = '${HttpConfig.URL_PREFIX}/v1/deals';

  DealViewModel();

  Future<http.Response> postDeal(DealPostDto dealPostDto) async {
    http.Response res = await http.post(
      POST_DEAL,
      body: dealPostDto.toJson(),
    );
    return res;
  }

  Future<List<DealDto>> getDealList(String filter, String field, String keyword, String orders, String paging) async {
    String url = GET_DEAL_LIST;
    if ((filter != null && filter.isNotEmpty)
        || (field != null && field.isNotEmpty)
        || (keyword != null && keyword.isNotEmpty)
        || (orders != null && orders.isNotEmpty)
        || (paging != null && paging.isNotEmpty)) {
      url = '$url?';
      if (field != null && field.isNotEmpty) url = '${url}field=$field';
      if (keyword != null && keyword.isNotEmpty) url = '${url}keyword=$keyword';
      if (orders != null && orders.isNotEmpty) url = '${url}orders=$orders';
      if (paging != null && paging.isNotEmpty) url = '${url}paging=$paging';
    }

    http.Response res = await http.get(url);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<DealDto> dealList = [];
    for (dynamic json in bodyJson['result']) {
      DealDto dealDto = new DealDto.fromJson(json);
      dealList.add(dealDto);
    }

    return dealList;
  }
}