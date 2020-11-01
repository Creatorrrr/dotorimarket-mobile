import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/views/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';


class HttpUtil {
  static const GET_AND_APK = '${HttpConfig.URL_PREFIX}/download/v1/apps/dotori-android.apk';
  static const GET_IOS_PLIST = 'itms-services://?action=download-manifest&url=${HttpConfig.URL_PREFIX}/download/v1/apps/dotori-ios.plist';

  static const String TOKEN_KEY = 'token';
  static const String TOKEN_PREFIX = 'Bearer';

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
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    http.Response res = await http.post(url,
      headers: headers,
      body: jsonEncode(body),
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// post multipart 요청
  static Future<Response> postMultipart(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    Dio dio = Dio();
    Response res = await dio.post(url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

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
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    http.Response res = await http.put(url,
      headers: headers,
      body: jsonEncode(body),
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// put multipart 요청
  static Future<Response> putMultipart(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    Dio dio = Dio();
    Response res = await dio.put(url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

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
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    http.Response res = await http.patch(url,
      headers: headers,
      body: jsonEncode(body),
      encoding: encoding,
    );

    _showUpdateDialog(res, context);

    return res;
  }

  /// patch multipart 요청
  static Future<Response> patchMultipart(dynamic url, BuildContext context, {
    Map<String, String> headers,
    Map<String, String> queryParams,
    dynamic body,
    Encoding encoding,
  }) async {
    url = _setQueryParams(url, queryParams);

    headers = await _setDefaultHeaders(headers);
    if (StringUtil.isEmpty(headers['content-type'])) headers['content-type'] = 'application/json';

    Dio dio = Dio();
    Response res = await dio.patch(url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

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
    if (queryParams != null) {
      bool hasValue = false;
      queryParams.forEach((key, value) {
        if (StringUtil.isNotEmpty(value)) {
          if (hasValue) {
            url = '$url&$key=$value';
          } else {
            url = '$url?$key=$value';
            hasValue = true;
          }
        }
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(TOKEN_KEY);
    if (StringUtil.isNotEmpty(token)) headers['Authorization'] = '$TOKEN_PREFIX $token';

    return headers;
  }

  /// 업데이트 여부 확인 후 대화창 표시
  /// 취소 동작 앱 종료, 업데이트 동작 시 업데이트 진행
  static void _showUpdateDialog(http.Response res, BuildContext context) async {
    if (res.statusCode == HttpStatus.upgradeRequired) {
      Map<String, dynamic> body = jsonDecode(res.body);
      String message = body['message'];

      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(message),
            actions: [
              FlatButton(
                child: Text(CANCEL_TEXT),
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
              ),
              FlatButton(
                child: Text(UPDATE_TEXT),
                onPressed: () async {
                  if (Platform.isAndroid) {
                    await _downloadApp(GET_AND_APK);
                  } else if (Platform.isIOS) {
                    await _downloadApp(GET_IOS_PLIST);
                  } else {
                    Scaffold.of(context).removeCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('지원하지 않는 OS입니다 (OS: ${Platform.operatingSystem}')));
                  }
                  Navigator.pop(dialogContext);
                },
              ),
            ],
          );
        }
      );

      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
          => LoginPage(
            showUpdateMessage: true,
          ),
      ));
    }
  }

  /// 앱 다운로드
  static _downloadApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}