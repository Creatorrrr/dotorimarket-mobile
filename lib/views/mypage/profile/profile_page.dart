import 'dart:io';

import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/viewmodels/word_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/mypage/profile/layouts/body_layout.dart';
import 'package:dotorimarket/views/mypage/profile/layouts/header_layout.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double HEADER_TOP_HEIGHT = 50.0;

  File picture;
  String nickName;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: Scaffold(
        body: Builder(
          builder: (context) {
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
                        onComplete: () => _onComplete(context),
                      ),
                    ),
                    Positioned(
                      top: HEADER_TOP_HEIGHT,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: BodyLayout(
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
        ),
        backgroundColor: Colors.white,
      ),
      viewModels: [
        UserViewModel(),
        WordViewModel(),
      ],
    );
  }

  /// 닉네임 변경 완료
  void _onComplete(BuildContext context) {

  }
}