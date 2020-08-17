import 'package:dotorimarket/constants/app_constant.dart';
import 'package:dotorimarket/views/chat/chat_content_page.dart';
import 'package:dotorimarket/views/good/list/good_list_page.dart';
import 'package:dotorimarket/views/login/widgets/login_text_field.dart';
import 'package:dotorimarket/views/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String TEXT_EMAIL = 'Email';
  static const String TEXT_PASSWORD = 'Password';
  static const String TEXT_LOGIN = '로그인';
  static const String TEXT_SIGN_UP = '회원가입';
  static const double PAGE_PADDING = 5.0;
  static const double WIDGET_PADDING = 5.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                        controller: TextEditingController(),
                      ),
                      padding: EdgeInsets.all(WIDGET_PADDING),
                    ),
                    Container(
                      child: LoginTextField(
                        labelText: TEXT_PASSWORD,
                        icon: Icon(Icons.lock),
                        controller: TextEditingController(),
                      ),
                      padding: EdgeInsets.all(WIDGET_PADDING),
                    ),
                    Container(
                      child: LoginButton(
                        text: TEXT_LOGIN,
                        textColor: Colors.white,
                        buttonColor: Colors.blue,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                              builder: (context) {
                                return GoodListPage();
                              }
                          ));
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
    );
  }
}