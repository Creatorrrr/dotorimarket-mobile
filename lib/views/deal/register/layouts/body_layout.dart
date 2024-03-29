import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/common/formatters/currency_formatter.dart';
import 'package:dotorimarket/views/common/widgets/picture_selection_dialog.dart';
import 'package:dotorimarket/views/deal/list/deal_list_page.dart';
import 'package:dotorimarket/views/deal/common/widgets/deal_bottom_button.dart';
import 'package:dotorimarket/views/deal/common/widgets/deal_dropdown_button_form_field.dart';
import 'package:dotorimarket/views/deal/common/widgets/deal_dropdown_menu_item.dart';
import 'package:dotorimarket/views/deal/common/widgets/picture_preview.dart';
import 'package:dotorimarket/views/deal/common/widgets/picture_selection.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/dtos/deal/deal_post_dto.dart';
import 'package:dotorimarket/viewmodels/deal_view_model.dart';
import 'package:dotorimarket/views/common/view_model_provider.dart';
import 'package:dotorimarket/views/deal/common/widgets/deal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  static const double HORIZONTAL_PADDING = 15.0;
  static const double PICTURE_SELECTION_SIZE = 70.0;
  static const double PICTURE_SELECTION_TOP_MARGIN = 7.0;
  static const double PICTURE_PREVIEW_RIGHT_MARGIN = 5.0;
  static const double PICTURE_PREVIEW_CLOSE_BUTTON_OVERFLOW_SIZE = 8.0;
  static const double TITLE_TOP_PADDING = 30.0;
  static const double TEXT_FORM_FIELD_TOP_PADDING = 15.0;
  static const double REGISTER_BUTTON_HEIGHT = 70.0;

  static const String GOOD_NAME_HINT_TEXT = '상품 이름';
  static const String CATEGORY_HINT_TEXT = '카테고리';
  static const String PRICE_HINT_TEXT = '₩ 가격';
  static const String DESCRIPTION_HINT_TEXT = '판매할 상품의 설명을 작성해주세요';
  static const String BOTTOM_BUTTON_TEXT = '등록하기';
  static const String CONFIRM_DIALOG_TITLE = '등록하시겠습니까?';
  static const String CONFIRM_DIALOG_CANCEL = '취소';
  static const String CONFIRM_DIALOG_REGISTER = '등록하기';

  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController categoryTextEditingController = TextEditingController();
  final TextEditingController priceTextEditingController = TextEditingController();
  final TextEditingController descriptionTextEditingController = TextEditingController();

  CategoryDto selectedCategory;
  List<File> pictureList = [];

  @override
  Widget build(BuildContext context) {
    final CategoryViewModel categoryViewModel = ViewModelProvider.of<CategoryViewModel>(context);

    return Container(
      child: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: PictureSelection(
                              height: PICTURE_SELECTION_SIZE,
                              width: PICTURE_SELECTION_SIZE,
                              onPressed: () async {
                                // 사진 선택 모달 열기
                                PictureSelectionDialog.openDialog(context,
                                  onCameraPressed: (pickedFile) {
                                    setState(() {
                                      pictureList.add(pickedFile);
                                    });
                                  },
                                  onGalleryPressed: (pickedFile) {
                                    setState(() {
                                      pictureList.add(pickedFile);
                                    });
                                  },
                                );
                              },
                            ),
                            margin: const EdgeInsets.only(
                              top: PICTURE_PREVIEW_CLOSE_BUTTON_OVERFLOW_SIZE,
                              right: PICTURE_PREVIEW_RIGHT_MARGIN + PICTURE_PREVIEW_CLOSE_BUTTON_OVERFLOW_SIZE,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: PicturePreview(
                                    image: Image.file(pictureList[index],
                                      fit: BoxFit.cover,
                                    ),
                                    height: PICTURE_SELECTION_SIZE,
                                    width: PICTURE_SELECTION_SIZE,
                                    closeButtonOverflowSize: PICTURE_PREVIEW_CLOSE_BUTTON_OVERFLOW_SIZE,
                                    onPressed: () {
                                      // 이미지 제거
                                      setState(() {
                                        pictureList.removeAt(index);
                                      });
                                    },
                                  ),
                                  margin: const EdgeInsets.only(
                                    right: PICTURE_PREVIEW_RIGHT_MARGIN,
                                  ),
                                );
                              },
                              itemCount: pictureList.length,
                            ),
                          ),
                        ],
                      ),
                      height: PICTURE_SELECTION_SIZE + PICTURE_PREVIEW_CLOSE_BUTTON_OVERFLOW_SIZE,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(
                        top: PICTURE_SELECTION_TOP_MARGIN,
                      ),
                      padding: const EdgeInsets.only(
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealTextField(
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
                      child: CheckedFutureBuilder(
                        future: categoryViewModel.getCategoryList("", "", "", "", "", context),
                        builder: (BuildContext context, AsyncSnapshot<List<CategoryDto>> snapshot) {
                          return DealDropdownButtonFormField(
                            hintText: CATEGORY_HINT_TEXT,
                            items: List.generate(snapshot.data.length, (index) => DealDropdownMenuItem(
                              text: snapshot.data[index].name,
                              value: snapshot.data[index],
                            )),
                            onChanged: (CategoryDto categoryDto) {
                              selectedCategory = categoryDto;
                            },
                          );
                        },
                      ),
                      padding: const EdgeInsets.only(
                        top: TEXT_FORM_FIELD_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealTextField(
                        controller: priceTextEditingController,
                        hintText: PRICE_HINT_TEXT,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyFormatter(),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        top: TEXT_FORM_FIELD_TOP_PADDING,
                        left: HORIZONTAL_PADDING,
                        right: HORIZONTAL_PADDING,
                      ),
                    ),
                    Container(
                      child: DealTextField(
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
              child: DealBottomButton(
                text: BOTTOM_BUTTON_TEXT,
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
    bool confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return  AlertDialog(
          title: Text(CONFIRM_DIALOG_TITLE),
          actions: [
            FlatButton(
              child: Text(CONFIRM_DIALOG_CANCEL),
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
            ),
            FlatButton(
              child: Text(CONFIRM_DIALOG_REGISTER),
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
            ),
          ],
        );
      },
    );

    if (confirmed == null || !confirmed) return;

    final DealViewModel dealViewModel = ViewModelProvider.of<DealViewModel>(context);

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('id');

      // 거래 데이터
      DealPostDto dealPostDto = DealPostDto(
        title: titleTextEditingController.text.trim(),
        category: selectedCategory.id,
        price: priceTextEditingController.text.trim().replaceAll(RegExp(r'[^\d]'), ''),
        description: descriptionTextEditingController.text.trim(),
        seller: userId,
      );

      // validation 확인
      _checkRegisterForm(dealPostDto);

      // 로그인 요청
      Response res = await dealViewModel.postDeal(dealPostDto, pictureList, context);

      // 성공여부 확인
      if (res.statusCode == HttpStatus.ok) {
        // 화면 이동
        Navigator.pushReplacement(context, MaterialPageRoute<void>(
            builder: (context) {
              return DealListPage();
            }
        ));
      } else {
        Map<String, dynamic> bodyJson = jsonDecode(res.data);
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
    if (dealPostDto == null) {
      throw '개발자에게 문의해주세요 : dto parameter is null';
    }
    if (StringUtil.isEmpty(dealPostDto.title)) {
      throw '제목을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPostDto.category)) {
      throw '카테고리를 선택해주세요';
    }
    if (StringUtil.isEmpty(dealPostDto.price)) {
      throw '가격을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPostDto.description)) {
      throw '상품의 설명을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPostDto.seller)) {
      throw '개발자에게 문의해주세요 : seller parameter is null';
    }
  }
}
