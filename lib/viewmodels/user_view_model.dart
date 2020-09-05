import 'dart:convert';
import 'dart:io';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';

class UserViewModel extends ViewModel {
  static const POST_USER = '${HttpConfig.URL_PREFIX}/v1/users';

  final BuildContext context;

  UserViewModel(
    this.context,
  );

  Future<Response> postUser(UserLoginDto userLoginDto) async {
    Response res = await HttpUtil.post(
      POST_USER,
      context,
      body: userLoginDto.toJson(),
    );

    return res;
  }
}