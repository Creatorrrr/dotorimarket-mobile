import 'package:dotorimarket/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginPage(),
    );
  }
}
