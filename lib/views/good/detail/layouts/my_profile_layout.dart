import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyProfileLayout extends StatelessWidget {
  static const String GOOD_IMAGE_PATH = 'assets/dotori-logo.png';

  final String name;
  final String description;

  MyProfileLayout({
    Key key,
    @required this.name,
    this.description,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: AssetImage(GOOD_IMAGE_PATH),
              backgroundColor: Colors.transparent,
              radius: 40.0,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    this.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    this.description ?? '',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}