import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dotorimarket/constants/app_constant.dart';
import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/list/good_list_page.dart';
import 'package:dotorimarket/views/login/widgets/login_text_field.dart';
import 'package:dotorimarket/views/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String TEXT_EMAIL = '이메일';
  static const String TEXT_PASSWORD = '패스워드';
  static const String TEXT_LOGIN = '로그인';
  static const String TEXT_SIGN_UP = '회원가입';
  static const String TEXT_FIND_ID = '아이디 찾기';
  static const String TEXT_FIND_PASSWORD = '비밀번호 찾기';
  static const double PAGE_PADDING = 5.0;
  static const double WIDGET_PADDING = 5.0;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: GestureDetector(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return SafeArea(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          AppConstant.APP_TITLE,
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 100,
                        ),
                        alignment: Alignment(0.0, 0.0),
                      ),
                      Container(
                        child: LoginTextField(
                          labelText: TEXT_EMAIL,
                          icon: Icon(Icons.email),
                          controller: emailTextController,
                        ),
                        padding: EdgeInsets.all(WIDGET_PADDING),
                      ),
                      Container(
                        child: LoginTextField(
                          labelText: TEXT_PASSWORD,
                          icon: Icon(Icons.lock),
                          controller: passwordTextController,
                        ),
                        padding: EdgeInsets.all(WIDGET_PADDING),
                      ),
                      Container(
                        child: LoginButton(
                          text: TEXT_LOGIN,
                          textColor: Colors.white,
                          buttonColor: Colors.blue,
                          onPressed: () {
                            _onLoginPressed(context); // 로그인 버튼 동작
                          },
                        ),
                        padding: EdgeInsets.all(WIDGET_PADDING),
                      ),
                      Container(
                        child: LoginButton(
                          text: TEXT_SIGN_UP,
                          onPressed: () {

                          },
                        ),
                        padding: EdgeInsets.all(WIDGET_PADDING),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                TEXT_FIND_ID,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                  ' | '
                              ),
                            ),
                            Container(
                              child: Text(
                                TEXT_FIND_PASSWORD,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        padding: const EdgeInsets.all(10.0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(PAGE_PADDING),
                ),
              );
            },
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
      viewModel: UserViewModel(),
    );
  }

  /// 로그인 버튼 동작
  void _onLoginPressed(BuildContext context) async {
    try {
      // 로그인 데이터
      UserLoginDto userLoginDto = UserLoginDto(
        userId: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );

      // validation 확인
      _checkLoginForm(userLoginDto);

      // 로그인 요청
      http.Response res = await ViewModelProvider.of<UserViewModel>(context).postUser(userLoginDto);

      // 성공여부 확인
      if (res.statusCode == 200) {
        // 화면 이동
        Navigator.pushReplacement(context, MaterialPageRoute<void>(
          builder: (context) {
            return GoodListPage();
          },
        ));
      } else {
        Map<String, dynamic> bodyJson = jsonDecode(res.body);
        String message = bodyJson['message'];

        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));  // 서버 메시지 출력
      }
    } catch (err) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
    }
  }

  /// login form의 validation 확인
  void _checkLoginForm(UserLoginDto userLoginDto) {
    if (userLoginDto == null) {
      throw '개발자에게 문의해주세요 : dto parameter is null';
    }
    if (userLoginDto.userId == null || userLoginDto.userId.isEmpty) {
      throw '$TEXT_EMAIL를 입력해주세요';
    }
    if (userLoginDto.password == null || userLoginDto.password.isEmpty) {
      throw '$TEXT_PASSWORD를 입력해주세요';
    }
  }
}