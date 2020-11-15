import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_patch_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sprintf/sprintf.dart';

class DealViewModel extends ViewModel {
  static const POST_DEAL = '${HttpConfig.URL_MOBILE_PREFIX}/v1/deals';
  static const PATCH_DEAL = '${HttpConfig.URL_MOBILE_PREFIX}/v1/deals/%s';
  static const DELETE_DEAL = '${HttpConfig.URL_MOBILE_PREFIX}/v1/deals/%s';
  static const GET_DEAL_ONE = '${HttpConfig.URL_MOBILE_PREFIX}/v1/deals/%s';
  static const GET_DEAL_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/deals';
  static const POST_FAVORITE = '${HttpConfig.URL_MOBILE_PREFIX}/v1/favorites';
  static const GET_FAVORITE_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/favorites';

  Future<Response> postDeal(DealPostDto dealPostDto, List<File> imgs, BuildContext context) async {
    FormData body = FormData();
    body.files.add(MapEntry('deal', MultipartFile.fromString(jsonEncode(dealPostDto.toJson()),
      contentType: MediaType('application', 'json'),
    )));
    if (imgs != null) {
      for (File img in imgs) {
        body.files.add(MapEntry('imgs', await MultipartFile.fromFile(img.path)));
      }
    }

    Response res = await HttpUtil.postMultipart(
      POST_DEAL,
      context,
      body: body,
    );

    return res;
  }

  Future<Response> patchDeal(String dealId, DealPatchDto dealPatchDto, List<File> imgs, BuildContext context) async {
    String url = sprintf(PATCH_DEAL, [dealId]);

    FormData body = FormData();
    body.files.add(MapEntry('deal', MultipartFile.fromString(jsonEncode(dealPatchDto.toJson()),
      contentType: MediaType('application', 'json'),
    )));
    if (imgs != null) {
      for (File img in imgs) {
        body.files.add(MapEntry('imgs', await MultipartFile.fromFile(img.path)));
      }
    }

    Response res = await HttpUtil.patchMultipart(
      url,
      context,
      body: body,
    );

    return res;
  }

  Future<http.Response> deleteDeal(String dealId, BuildContext context) async {
    String url = sprintf(DELETE_DEAL, [dealId]);

    http.Response res = await HttpUtil.delete(
      url,
      context,
    );

    return res;
  }

  Future<DealDto> getDealOne(String dealId, BuildContext context) async {
    String url = sprintf(GET_DEAL_ONE, [dealId]);

    http.Response res = await HttpUtil.get(url, context);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    DealDto deal = new DealDto.fromJson(bodyJson['result']);

    return deal;
  }

  Future<List<DealDto>> getDealList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_DEAL_LIST;

    Map<String, String> queryParams = {
      'filter': filter,
      'field': field,
      'keyword': keyword,
      'orders': orders,
      'paging': paging,
    };

    http.Response res = await HttpUtil.get(url, context,
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

  Future<http.Response> postFavorite(String dealId, BuildContext context) async {
    http.Response res = await HttpUtil.post(
      POST_FAVORITE,
      context,
      body: {
        'dealId': dealId,
      },
    );
    return res;
  }

  Future<List<DealDto>> getFavoriteList(BuildContext context) async {
    String url = GET_FAVORITE_LIST;

    http.Response res = await HttpUtil.get(url, context);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<DealDto> dealList = [];
    for (dynamic json in bodyJson['result']) {
      DealDto dealDto = new DealDto.fromJson(json);
      dealList.add(dealDto);
    }

    return dealList;
  }
}