import 'dart:convert';

import 'package:dotorimarket/views/good/list/deal_list_page.dart';
import 'package:dotorimarket/views/good/register/widgets/deal_register_button.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/good/register/widgets/deal_register_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const String IMAGE_PATH = 'assets/images/picture-selection.png';

  static const double HORIZONTAL_PADDING = 15.0;
  static const Color PICTURE_SELECTION_ICON_COLOR = Color.fromRGBO(255, 185, 65, 1.0);
  static const double PICTURE_SELECTION_FONT_SIZE = 12.0;
  static const double PICTURE_SELECTION_TEXT_TOP_PADDING = 5.0;
  static const double PICTURE_SELECTION_BORDER_WIDTH = 1.0;
  static const double PICTURE_SELECTION_BORDER_RADIUS = 10.0;
  static const double PICTURE_SELECTION_SIZE = 70.0;
  static const double PICTURE_SELECTION_TOP_PADDING = 15.0;
  static const double TITLE_TOP_PADDING = 30.0;
  static const double TEXT_FORM_FIELD_TOP_PADDING = 15.0;
  static const double REGISTER_BUTTON_HEIGHT = 70.0;

  static const String PICTURE_SELECTION_TEXT = '사진선택';
  static const String GOOD_NAME_HINT_TEXT = '상품 이름';
  static const String CATEGORY_HINT_TEXT = '카테고리';
  static const String PRICE_HINT_TEXT = '₩ 가격';
  static const String DESCRIPTION_HINT_TEXT = '설명';

  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController categoryTextEditingController = TextEditingController();
  final TextEditingController priceTextEditingController = TextEditingController();
  final TextEditingController descriptionTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ImagePicker imagePicker = ImagePicker();

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Image.asset(
                                IMAGE_PATH,
                                color: PICTURE_SELECTION_ICON_COLOR,
                              ),
                              Container(
                                child: const Text(PICTURE_SELECTION_TEXT,
                                  style: const TextStyle(
                                    fontSize: PICTURE_SELECTION_FONT_SIZE,
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                  top: PICTURE_SELECTION_TEXT_TOP_PADDING,
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                          height: PICTURE_SELECTION_SIZE,
                          width: PICTURE_SELECTION_SIZE,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: PICTURE_SELECTION_BORDER_WIDTH,
                            ),
                            borderRadius: BorderRadius.circular(PICTURE_SELECTION_BORDER_RADIUS),
                          ),
                        ),
                        onTap: () async {
                          PickedFile pickedFile = await imagePicker.getImage(
                            source: ImageSource.gallery
                          );
                          print(pickedFile.path);
                        },
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        top: PICTURE_SELECTION_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealRegisterInput(
                        controller: titleTextEditingController,
                        hintText: GOOD_NAME_HINT_TEXT,
                      ),
                      padding: const EdgeInsets.only(
                        top: TITLE_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
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
                      padding: const EdgeInsets.only(
                        top: TEXT_FORM_FIELD_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealRegisterInput(
                        controller: priceTextEditingController,
                        hintText: PRICE_HINT_TEXT,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          _CurrencyFormat(),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        top: TEXT_FORM_FIELD_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealRegisterInput(
                        controller: descriptionTextEditingController,
                        hintText: DESCRIPTION_HINT_TEXT,
                        keyboardType: TextInputType.multiline,
                        enabledBorder: InputBorder.none,
                      ),
                      padding: const EdgeInsets.only(
                        top: TEXT_FORM_FIELD_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            top: 0.0,
            bottom: REGISTER_BUTTON_HEIGHT,
            left: 0.0,
            right: 0.0,
          ),
          Positioned(
            child: Container(
              child: DealRegisterButton(
                onPressed: () {
                  _onRegisterPressed(context);
                },
              ),
              height: REGISTER_BUTTON_HEIGHT,
              width: double.infinity,
            ),
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
          ),
        ],
      ),
    );
  }

  /// 등록 버튼 동작
  void _onRegisterPressed(BuildContext context) async {
    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    try {
      // 로그인 데이터
      DealPostDto dealPostDto = DealPostDto(
        title: titleTextEditingController.text.trim(),
        price: priceTextEditingController.text.trim().replaceAll(RegExp(r'[^\d]'), ''),
        description: descriptionTextEditingController.text.trim(),
      );

      // validation 확인
      _checkRegisterForm(dealPostDto);

      // 로그인 요청
      http.Response res = await dealViewModel.postDeal(dealPostDto, context);

      // 성공여부 확인
      if (res.statusCode == 200) {
        // 화면 이동
        Navigator.pushReplacement(context, MaterialPageRoute<void>(
            builder: (context) {
              return DealListPage();
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

class _CurrencyFormat extends TextInputFormatter {
  static const int VALUE_LENGTH_LIMIT = 14;
  static const String WON = '₩';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > VALUE_LENGTH_LIMIT) return oldValue;

    if (newValue.text.trim() == WON) {
      return newValue.copyWith(text: '');
    } else {
      final currencyNumberFormat = new NumberFormat.currency(
        decimalDigits: 0,
        symbol: '$WON ',
      );

      int num = int.parse(newValue.text.replaceAll(RegExp(r'[^\d]'), ''));
      final newString = currencyNumberFormat.format(num);

      return TextEditingValue(
        selection: TextSelection.fromPosition(TextPosition(
          offset: newString.length,
        )),
        text: newString
      );
    }
  }
}