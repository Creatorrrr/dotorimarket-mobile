import 'dart:convert';
import 'dart:io';

import 'package:dotorimarket/views/login/widgets/find_button.dart';
import 'package:dotorimarket/views/login/widgets/save_email_checkbox.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/constants/app_constant.dart';
import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/list/deal_list_page.dart';
import 'package:dotorimarket/views/login/widgets/login_text_field.dart';
import 'package:dotorimarket/views/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const double LOGO_HEIGHT = 200.0;
  static const double APP_TITLE_FONT_SIZE = 28.0;
  static const double HORIZONTAL_PADDING = 10.0;
  static const double LOGIN_TEXT_FIELD_TOP_PADDING = 10.0;
  static const double LOGIN_BUTTON_TOP_PADDING = 10.0;
  static const double FIND_FONT_SIZE = 16.0;

  static const String SAVE_EMAIL_KEY = 'saveEmail';
  static const String EMAIL_KEY = 'email';
  static const String TOKEN_KEY = 'token';

  static const String EMAIL_TEXT = '이메일';
  static const String PASSWORD_TEXT = '패스워드';
  static const String LOGIN_TEXT = '로그인';
  static const String SIGN_UP_TEXT = '회원가입';
  static const String FIND_ID_TEXT = '아이디 찾기';
  static const String FIND_PASSWORD_TEXT = '패스워드 찾기';
  static const String SAVE_EMAIL_PASSWORD_TEXT = '아이디 저장';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  bool saveEmail = false;

  @override
  void initState() {
    // shared preferences에서 아이디 저장 여부를 확인하고 이메일 초기화
    // 초기화 여부를 보장하지 음 (페이지 동작에 큰 영향을 주지 않음)
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        saveEmail = prefs.getBool(SAVE_EMAIL_KEY) ?? false;
        if (saveEmail) {
          String email = prefs.getString(EMAIL_KEY);
          emailController.text = email;
        }
      });
    });
    super.initState();
  }

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
                        child: const Text(
                          AppConstant.APP_TITLE,
                          style: const TextStyle(
                            fontSize: APP_TITLE_FONT_SIZE,
                          ),
                        ),
                        alignment: Alignment.center,
                        height: LOGO_HEIGHT,
                      ),
                      Container(
                        child: LoginTextField(
                          labelText: EMAIL_TEXT,
                          icon: const Icon(Icons.email),
                          controller: emailController,
                          onFieldSubmitted: (String value) {
                            FocusScope.of(context).requestFocus(passwordFocusNode);
                          }
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: HORIZONTAL_PADDING,
                        ),
                      ),
                      Container(
                        child: LoginTextField(
                          labelText: PASSWORD_TEXT,
                          icon: const Icon(Icons.lock),
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                        ),
                        padding: const EdgeInsets.only(
                          top: LOGIN_TEXT_FIELD_TOP_PADDING,
                          left: HORIZONTAL_PADDING,
                          right: HORIZONTAL_PADDING,
                        ),
                      ),
                      Container(
                        child: LoginButton(
                          text: LOGIN_TEXT,
                          textColor: Colors.white,
                          buttonColor: Colors.blue,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            _onLoginPressed(context); // 로그인 버튼 동작
                          },
                        ),
                        padding: const EdgeInsets.only(
                          top: LOGIN_BUTTON_TOP_PADDING,
                          left: HORIZONTAL_PADDING,
                          right: HORIZONTAL_PADDING,
                        ),
                      ),
                      Container(
                        child: LoginButton(
                          text: SIGN_UP_TEXT,
                          onPressed: () {
                            // TODO 회원가입 페이지로 이동
                          },
                        ),
                        padding: const EdgeInsets.only(
                          top: LOGIN_BUTTON_TOP_PADDING,
                          left: HORIZONTAL_PADDING,
                          right: HORIZONTAL_PADDING,
                        ),
                      ),
                      Container(
                        child: SaveEmailCheckbox(
                          title: SAVE_EMAIL_PASSWORD_TEXT,
                          value: saveEmail,
                          onChanged: (bool value) async {
                            setState(() {
                              saveEmail = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            FindButton(
                              text: FIND_ID_TEXT,
                              onPressed: () {
                                // TODO 아이디 찾기 페이지로 이동
                              },
                            ),
                            const Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: FIND_FONT_SIZE,
                              ),
                            ),
                            FindButton(
                              text: FIND_PASSWORD_TEXT,
                              onPressed: () {
                                // TODO 패스워드 찾기 페이지로 이동
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        padding: const EdgeInsets.only(
                          left: HORIZONTAL_PADDING,
                          right: HORIZONTAL_PADDING,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          resizeToAvoidBottomInset: false,
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
      viewModels: [
        UserViewModel(),
      ],
    );
  }

  /// 로그인 버튼 동작
  void _onLoginPressed(BuildContext context) async {
    final UserViewModel userViewModel = ViewModelProvider.of<UserViewModel>(context);

    try {
      // 로그인 데이터
      UserLoginDto userLoginDto = UserLoginDto(
        userId: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // validation 확인
      _checkLoginForm(userLoginDto);

      // 로그인 요청
      http.Response res = await userViewModel.postUser(userLoginDto, context);

      // 성공여부 확인
      if (res.statusCode == HttpStatus.ok) {
        // 아이디 저장을 선택했을 경우 이메일 저장, 아이디 저장 여부 저장
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool(SAVE_EMAIL_KEY, saveEmail);
        if (saveEmail) {
          prefs.setString(EMAIL_KEY, emailController.text);
        } else {
          prefs.setString(EMAIL_KEY, null);
        }
        Map<String, dynamic> body = jsonDecode(res.body);
        String token = body['result']['token'];
        prefs.setString(TOKEN_KEY, token);

        // 화면 이동
        Navigator.pushReplacement(context, MaterialPageRoute<void>(
          builder: (context) {
            return DealListPage();
          },
        ));
      } else {
        Map<String, dynamic> bodyJson = jsonDecode(res.body);
        String message = bodyJson['message'];

        throw message;
      }
    } catch (err) {
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
    }
  }

  /// login form의 validation 확인
  void _checkLoginForm(UserLoginDto userLoginDto) {
    if (userLoginDto == null) {
      throw '개발자에게 문의해주세요 (dto parameter is null)';
    }
    if (userLoginDto.userId == null || userLoginDto.userId.isEmpty) {
      throw '$EMAIL_TEXT를 입력해주세요';
    }
    if (userLoginDto.password == null || userLoginDto.password.isEmpty) {
      throw '$PASSWORD_TEXT를 입력해주세요';
    }
  }
}