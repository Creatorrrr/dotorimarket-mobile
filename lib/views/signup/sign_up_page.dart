import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/account_view_model.dart';
import 'package:dotorimarket/viewmodels/word_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/login/login_page.dart';
import 'package:dotorimarket/views/signup/layouts/body_layout.dart';
import 'package:dotorimarket/views/signup/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const double HEADER_TOP_HEIGHT = 50.0;

  static const String PICTURE_TEXT = '이미지를 선택해주세요';
  static const String ACCOUNT_ID_TEXT = '아이디를 입력해주세요';
  static const String PASSWORD_TEXT = '패스워드를 입력해주세요';
  static const String NICK_NAME_TEXT = '닉네임을 입력해주세요';
  static const String PLACE_TEXT = '장소를 입력해주세요';

  File picture;
  String accountId;
  String password;
  String nickName;
  String place;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      height: HEADER_TOP_HEIGHT,
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: HeaderLayout(
                        height: HEADER_TOP_HEIGHT,
                        onComplete: () => _registerAccount(context),
                      ),
                    ),
                    Positioned(
                      top: HEADER_TOP_HEIGHT,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: BodyLayout(
                        onChanged: (File picture, String accountId, String password, String nickName, String place) {
                          this.picture = picture;
                          this.accountId = accountId;
                          this.password = password;
                          this.nickName = nickName;
                          this.place = place;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
      viewModels: [
        AccountViewModel(),
        WordViewModel(),
      ],
    );
  }

  void _registerAccount(BuildContext context) async {
    final AccountViewModel accountViewModel = ViewModelProvider.of<AccountViewModel>(context);

    try {
      AccountDto accountDto = AccountDto(
        accountId: accountId,
        password: password,
        name: nickName,
        place: place,
      );

      // validation 확인
      _checkChangeNickNameForm(accountDto);

      // 계정 생성 요청
      Response res = await accountViewModel.postAccount(accountDto, picture, context);

      // 성공여부 확인
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = res.data;

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ), (Route<dynamic> route) => false);
      } else {
        Map<String, dynamic> bodyJson = jsonDecode(res.data);
        String message = bodyJson['message'];

        throw message;
      }
    } catch (err) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
    }
  }

  /// login form의 validation 확인
  void _checkChangeNickNameForm(AccountDto accountDto) {
    if (accountDto == null) {
      throw '개발자에게 문의해주세요 (dto parameter is null)';
    }
    if (picture == null) {
      throw PICTURE_TEXT;
    }
    if (StringUtil.isEmpty(accountDto.accountId)) {
      throw ACCOUNT_ID_TEXT;
    }
    if (StringUtil.isEmpty(accountDto.password)) {
      throw PASSWORD_TEXT;
    }
    if (StringUtil.isEmpty(accountDto.name)) {
      throw NICK_NAME_TEXT;
    }
    if (StringUtil.isEmpty(accountDto.place)) {
      throw PLACE_TEXT;
    }
  }
}