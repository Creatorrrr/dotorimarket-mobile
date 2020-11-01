import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sprintf/sprintf.dart';

class AccountViewModel extends ViewModel {
  static const POST_ACCOUNT = '${HttpConfig.URL_MOBILE_PREFIX}/v1/accounts';
  static const PATCH_ACCOUNT = '${HttpConfig.URL_MOBILE_PREFIX}/v1/accounts/%s';
  static const GET_ACCOUNT_ONE = '${HttpConfig.URL_MOBILE_PREFIX}/v1/accounts/%s';

  Future<http.Response> postAccount(AccountDto accountDto, BuildContext context) async {
    http.Response res = await HttpUtil.post(
      POST_ACCOUNT,
      context,
      body: accountDto.toJson(),
    );

    return res;
  }

  Future<Response> patchAccount(String id, AccountDto accountDto, File img, BuildContext context) async {
    String url = sprintf(PATCH_ACCOUNT, [id]);


    FormData body = FormData();
    body.files.add(MapEntry('account', MultipartFile.fromString(jsonEncode(accountDto.toJson()),
      contentType: MediaType('application', 'json'),
    )));
    body.files.add(MapEntry('img', await MultipartFile.fromFile(img.path)));

    Response res = await HttpUtil.patchMultipart(
      url,
      context,
      body: body,
    );

    return res;
  }

  Future<AccountDto> getAccountOne(String dealId, BuildContext context) async {
    String url = sprintf(GET_ACCOUNT_ONE, [dealId]);

    http.Response res = await HttpUtil.get(url, context);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    AccountDto account = new AccountDto.fromJson(bodyJson['result']);

    return account;
  }
}