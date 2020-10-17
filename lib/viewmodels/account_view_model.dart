import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:sprintf/sprintf.dart';

class AccountViewModel extends ViewModel {
  static const POST_ACCOUNT = '${HttpConfig.URL_MOBILE_PREFIX}/v1/accounts';
  static const PATCH_ACCOUNT = '${HttpConfig.URL_MOBILE_PREFIX}/v1/accounts/%s';

  Future<Response> postAccount(AccountDto accountDto, BuildContext context) async {
    Response res = await HttpUtil.post(
      POST_ACCOUNT,
      context,
      body: accountDto.toJson(),
    );

    return res;
  }

  Future<Response> patchAccount(String id, AccountDto accountDto, BuildContext context) async {
    String url = sprintf(PATCH_ACCOUNT, [id]);

    Response res = await HttpUtil.patch(
      url,
      context,
      body: accountDto.toJson(),
    );

    return res;
  }
}