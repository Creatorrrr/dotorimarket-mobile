import 'package:dotorimarket/views/login/layouts/body_layout.dart';
import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String UPDATE_MESSAGE_TEXT = '업데이트 후 사용하실 수 있습니다';

  final bool showUpdateMessage;

  LoginPage({
    Key key,
    this.showUpdateMessage = false,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: GestureDetector(
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (showUpdateMessage) {
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(UPDATE_MESSAGE_TEXT)
                  ));
                }
              });
              return SafeArea(
                child: BodyLayout(),
              );
            },
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
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
}