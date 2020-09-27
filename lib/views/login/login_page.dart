import 'package:dotorimarket/views/login/layouts/body_layout.dart';
import 'package:dotorimarket/viewmodels/user_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      child: GestureDetector(
        child: Scaffold(
          body: Builder(
            builder: (context) {
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