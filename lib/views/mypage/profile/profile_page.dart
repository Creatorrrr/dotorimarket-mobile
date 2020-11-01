import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/dtos/account/account_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/account_view_model.dart';
import 'package:dotorimarket/viewmodels/word_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/mypage/profile/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/profile/layouts/header_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double HEADER_TOP_HEIGHT = 50.0;

  static const String NICK_NAME_TEXT = '닉네임';

  File picture;
  String nickName;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return CheckedFutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
                SharedPreferences prefs = snapshot.data;
                String name = prefs.getString('name');
                String img = prefs.getString('img');

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
                            onComplete: () => _changeNickName(context),
                          ),
                        ),
                        Positioned(
                          top: HEADER_TOP_HEIGHT,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: BodyLayout(prefs, img, name,
                            onChanged: (File picture, String nickName) {
                              this.picture = picture;
                              this.nickName = nickName;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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

  /// 닉네임 변경 완료
  void _changeNickName(BuildContext context) async {
    final AccountViewModel accountViewModel = ViewModelProvider.of<AccountViewModel>(context);

    try {
      AccountDto accountDto = AccountDto(
        name: nickName,
      );

      // validation 확인
      _checkChangeNickNameForm(accountDto);

      // 닉네임 수정 요청
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('id');
      Response res = await accountViewModel.patchAccount(id, accountDto, picture, context);

      // 성공여부 확인
      if (res.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body = res.data;
        prefs.setString('name', body['result']['name']);
        prefs.setString('img', body['result']['img']['path']);

        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('수정되었습니다')));
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
    if (StringUtil.isEmpty(accountDto.name)) {
      throw '$NICK_NAME_TEXT을 입력해주세요';
    }
  }
}