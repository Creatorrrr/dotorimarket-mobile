import 'dart:convert';
import 'dart:io';

import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/list/deal_list_page.dart';
import 'package:dotorimarket/views/login/layouts/title_layout.dart';
import 'package:dotorimarket/views/login/widgets/login_button.dart';
import 'package:dotorimarket/views/login/widgets/login_text_field.dart';
import 'package:dotorimarket/views/login/widgets/save_email_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const double HORIZONTAL_PADDING = 30.0;
  static const double SAVE_EMAIL_CHECKBOX_LEFT_PADDING = 20.0;
  static const double EMAIL_LOGIN_TEXT_FIELD_TOP_MARGIN = 70.0;
  static const double PASSWORD_LOGIN_TEXT_FIELD_TOP_MARGIN = 10.0;
  static const double LOGIN_BUTTON_TOP_MARGIN = 30.0;
  // static const double FIND_FONT_SIZE = 16.0;

  static const String SAVE_EMAIL_KEY = 'saveEmail';
  static const String ID_KEY = 'id';
  static const String ACCOUNT_ID_KEY = 'accountId';
  static const String NAME_KEY = 'name';
  static const String PLACE_KEY = 'place';
  static const String EMAIL_KEY = 'email';
  static const String TOKEN_KEY = 'token';

  static const String EMAIL_TEXT = '이메일';
  static const String PASSWORD_TEXT = '패스워드';
  static const String LOGIN_TEXT = '로그인';
  // static const String SIGN_UP_TEXT = '회원가입';
  // static const String FIND_ID_TEXT = '아이디 찾기';
  // static const String FIND_PASSWORD_TEXT = '패스워드 찾기';
  static const String SAVE_EMAIL_PASSWORD_TEXT = '아이디 저장';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  bool saveEmail = false;

  @override
  void initState() {
    // shared preferences에서 아이디 저장 여부를 확인하고 이메일 초기화
    // 초기화 여부를 보장하지 않음 (페이지 동작에 큰 영향을 주지 않음)
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        saveEmail = prefs.getBool(SAVE_EMAIL_KEY) ?? false;
        if (saveEmail) {
          String accountId = prefs.getString(ACCOUNT_ID_KEY);
          emailController.text = accountId;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: TitleLayout(),
            padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING,
            ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING,
            ),
            margin: const EdgeInsets.only(
              top: EMAIL_LOGIN_TEXT_FIELD_TOP_MARGIN,
            ),
          ),
          Container(
            child: LoginTextField(
              labelText: PASSWORD_TEXT,
              icon: const Icon(Icons.lock),
              controller: passwordController,
              focusNode: passwordFocusNode,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: HORIZONTAL_PADDING,
            ),
            margin: const EdgeInsets.only(
              top: PASSWORD_LOGIN_TEXT_FIELD_TOP_MARGIN,
            ),
          ),
          Container(
            child: LoginButton(
              text: LOGIN_TEXT,
              onPressed: () {
                FocusScope.of(context).unfocus();
                _onLoginPressed(context); // 로그인 버튼 동작
              },
            ),
            padding: const EdgeInsets.only(
              top: LOGIN_BUTTON_TOP_MARGIN,
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
            padding: const EdgeInsets.only(
              left: SAVE_EMAIL_CHECKBOX_LEFT_PADDING,
            ),
          ),
          // Container(
          //   child: Row(
          //     children: [
          //       FindButton(
          //         text: FIND_ID_TEXT,
          //         onPressed: () {
          //           // TODO 아이디 찾기 페이지로 이동
          //         },
          //       ),
          //       const Text(
          //         ' | ',
          //         style: TextStyle(
          //           fontSize: FIND_FONT_SIZE,
          //         ),
          //       ),
          //       FindButton(
          //         text: FIND_PASSWORD_TEXT,
          //         onPressed: () {
          //           // TODO 패스워드 찾기 페이지로 이동
          //         },
          //       ),
          //     ],
          //     mainAxisAlignment: MainAxisAlignment.center,
          //   ),
          // ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
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
        prefs.setString(ID_KEY, body['result']['account']['id']);
        prefs.setString(ACCOUNT_ID_KEY, body['result']['account']['accountId']);
        prefs.setString(NAME_KEY, body['result']['account']['name']);
        prefs.setString(PLACE_KEY, body['result']['account']['place']);

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