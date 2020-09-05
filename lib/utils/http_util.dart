import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';

class HttpUtil {
  static const String CANCEL_TEXT = '취소';
  static const String UPDATE_TEXT = '업데이트';

  /// get 요청
  static Future<http.Response> get(String url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);

    http.Response res = await http.get(url,
      headers: headers,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// post 요청
  static Future<http.Response> post(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);

    http.Response res = await http.post(url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// put 요청
  static Future<http.Response> put(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);

    http.Response res = await http.put(url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// patch 요청
  static Future<http.Response> patch(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);

    http.Response res = await http.patch(url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// delete 요청
  static Future<http.Response> delete(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);

    http.Response res = await http.delete(url,
      headers: headers,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// url 쿼리 스트링 설정
  static String _setQueryParams(String url, Map<String, String> queryParams) {
    if (queryParams != null && queryParams.length > 0) {
      url = '$url?';
      queryParams.forEach((key, value) {
        url = '$url$key=$value';
      });
    }

    return url;
  }

  /// 기본 헤더 세팅
  static Future<Map<String, String>> _setDefaultHeaders(Map<String, String> headers) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;

    if (headers == null) headers = {};
    headers['app-version'] = appVersion;

    return headers;
  }

  /// 업데이트 여부 확인 후 대화창 표시
  /// 취소 동작 앱 종료, 업데이트 동작 시 업데이트 진행
  static void _showUpdateDialog(http.Response res, BuildContext context) async {
    if (res.statusCode == HttpStatus.upgradeRequired) {
      Map<String, dynamic> body = jsonDecode(res.body);
      String message = body['message'];

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(message),
              actions: [
                FlatButton(
                  child: Text(CANCEL_TEXT),
                  onPressed: () {
                    exit(0);
                  },
                ),
                FlatButton(
                  child: Text(UPDATE_TEXT),
                  onPressed: () {

                  },
                ),
              ],
            );
          }
      );
    }
  }
}