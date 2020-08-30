import 'dart:convert';

import 'package:dotorimarket/views/good/list/good_list_page.dart';
import 'package:dotorimarket/views/good/register/widgets/good_register_button.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/register/widgets/good_register_input.dart';
import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  static const String IMAGE_PATH = 'assets/dotori-logo.png';
  static const double IMAGE_HEIGHT = 100.0;
  static const double TEXT_FORM_FIELD_VERTICAL_PADDING = 5.0;
  static const double TEXT_FORM_FIELD_HORIZONTAL_PADDING = 10.0;
  static const double REGISTER_BUTTON_HEIGHT = 70.0;

  static const String GOOD_NAME_HINT_TEXT = '상품명';
  static const String CATEGORY_HINT_TEXT = '카테고리';
  static const String PRICE_HINT_TEXT = '가격';
  static const String DESCRIPTION_HINT_TEXT = '설명';

  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController categoryTextEditingController = TextEditingController();
  final TextEditingController priceTextEditingController = TextEditingController();
  final TextEditingController descriptionTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              IMAGE_PATH,
              height: IMAGE_HEIGHT,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              controller: titleTextEditingController,
              hintText: GOOD_NAME_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  child: Text('카테고리1'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('카테고리2'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('카테고리3'),
                  value: 3,
                ),
              ],
              onChanged: (value) {

              },
              decoration: InputDecoration(
                hintText: CATEGORY_HINT_TEXT,
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              controller: priceTextEditingController,
              hintText: PRICE_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Container(
            child: GoodRegisterInput(
              controller: descriptionTextEditingController,
              hintText: DESCRIPTION_HINT_TEXT,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TEXT_FORM_FIELD_VERTICAL_PADDING,
              horizontal: TEXT_FORM_FIELD_HORIZONTAL_PADDING,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            child: GoodRegisterButton(
              onPressed: () {
                _onRegisterPressed(context);
              },
            ),
            height: REGISTER_BUTTON_HEIGHT,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  /// 등록 버튼 동작
  void _onRegisterPressed(BuildContext context) async {
    try {
      // 로그인 데이터
      DealPostDto dealPostDto = DealPostDto(
        title: titleTextEditingController.text.trim(),
        price: priceTextEditingController.text.trim(),
        description: descriptionTextEditingController.text.trim(),
      );

      // validation 확인
      _checkRegisterForm(dealPostDto);

      // 로그인 요청
      http.Response res = await ViewModelProvider.of<DealViewModel>(context).postDeal(dealPostDto);

      // 성공여부 확인
      if (res.statusCode == 200) {
        // 화면 이동
        Navigator.pushReplacement(context, MaterialPageRoute<void>(
            builder: (context) {
              return GoodListPage();
            }
        ));
      } else {
        Map<String, dynamic> bodyJson = jsonDecode(res.body);
        String message = bodyJson['message'];

        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));  // 서버 메시지 출력
      }
    } catch (err) {
      print(err);
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(err.toString())));  // 오류 메시지 출력
    }
  }

  /// register form의 validation 확인
  void _checkRegisterForm(DealPostDto dealPostDto) {
    const String POSTFIX = '을(를) 입력해주세요';
    if (dealPostDto == null) {
      throw '개발자에게 문의해주세요 : dto parameter is null';
    }
    if (dealPostDto.title == null || dealPostDto.title.isEmpty) {
      throw '$GOOD_NAME_HINT_TEXT$POSTFIX';
    }
//    if (dealPostDto.categoryId == null || dealPostDto.categoryId.isEmpty) {
//      throw '$CATEGORY_HINT_TEXT$POSTFIX';
//    }
    if (dealPostDto.price == null || dealPostDto.price.isEmpty) {
      throw '$PRICE_HINT_TEXT$POSTFIX';
    }
    if (dealPostDto.description == null || dealPostDto.description.isEmpty) {
      throw '$DESCRIPTION_HINT_TEXT$POSTFIX';
    }
  }
}