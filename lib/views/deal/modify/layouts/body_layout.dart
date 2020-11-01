import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_dto.dart';
import 'package:dotorimarket/dtos/deal/deal_patch_dto.dart';
import 'package:dotorimarket/utils/string_util.dart';
import 'package:dotorimarket/viewmodels/category_view_model.dart';
import 'package:dotorimarket/views/common/widgets/checked_future_builder.dart';
import 'package:dotorimarket/views/common/widgets/permission_setting_dialog.dart';
import 'package:dotorimarket/views/common/formatters/currency_formatter.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyLayout extends StatefulWidget {
  final DealDto deal;

  BodyLayout(this.deal, {
    Key key,
  }):super(key: key);

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
  static const double MODIFY_BUTTON_HEIGHT = 70.0;

  static const String CAMERA_SELECTION_TEXT = '촬영하기';
  static const String GALLERY_SELECTION_TEXT = '갤러리에서 선택하기';
  static const String GOOD_NAME_HINT_TEXT = '상품 이름';
  static const String CATEGORY_HINT_TEXT = '카테고리';
  static const String PRICE_HINT_TEXT = '₩ 가격';
  static const String DESCRIPTION_HINT_TEXT = '판매할 상품의 설명을 작성해주세요';
  static const String BOTTOM_BUTTON_TEXT = '수정하기';
  static const String CONFIRM_DIALOG_TITLE = '등록하시겠습니까?';
  static const String CONFIRM_DIALOG_CANCEL = '취소';
  static const String CONFIRM_DIALOG_MODIFY = '수정하기';
  static const String CAMERA_PERMISSION_DIALOG_TITLE = '카메라 접근 권한이 필요합니다';
  static const String GALLERY_PERMISSION_DIALOG_TITLE = '갤러리 접근 권한이 필요합니다';

  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController priceTextEditingController = TextEditingController();
  final TextEditingController descriptionTextEditingController = TextEditingController();

  CategoryDto selectedCategory;
  List<File> pictureList = [];

  @override
  void initState() {
    final currencyNumberFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: '₩ ',
    );
    titleTextEditingController.text = widget.deal.title;
    selectedCategory = widget.deal.category;
    priceTextEditingController.text = currencyNumberFormat.format(widget.deal.price);
    descriptionTextEditingController.text = widget.deal.description;
    super.initState();
  }

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
                                _openPictureSelectionModal();
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
                          List<CategoryDto> categoryList = snapshot.data;

                          return DealDropdownButtonFormField(
                            currentText: selectedCategory.name,
                            hintText: CATEGORY_HINT_TEXT,
                            items: List.generate(categoryList.length, (index) => DealDropdownMenuItem(
                              text: categoryList[index].name,
                              value: categoryList[index],
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
            bottom: MODIFY_BUTTON_HEIGHT,
            left: 0.0,
            right: 0.0,
          ),
          Positioned(
            child: Container(
              child: DealBottomButton(
                text: BOTTOM_BUTTON_TEXT,
                onPressed: () {
                  _onModifyPressed(context);
                },
              ),
              height: MODIFY_BUTTON_HEIGHT,
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

  /// 수정 버튼 동작
  void _onModifyPressed(BuildContext context) async {
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
              child: Text(CONFIRM_DIALOG_MODIFY),
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

      DealPatchDto dealPatchDto = DealPatchDto(
        title: titleTextEditingController.text.trim(),
        category: selectedCategory.id,
        price: priceTextEditingController.text.trim().replaceAll(RegExp(r'[^\d]'), ''),
        description: descriptionTextEditingController.text.trim(),
        seller: userId,
      );

      // validation 확인
      _checkModifyForm(dealPatchDto);

      // 로그인 요청
      Response res = await dealViewModel.patchDeal(widget.deal.id, dealPatchDto, pictureList, context);

      // 성공여부 확인
      if (res.statusCode == 200) {
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

  /// modify form의 validation 확인
  void _checkModifyForm(DealPatchDto dealPatchDto) {
    if (dealPatchDto == null) {
      throw '개발자에게 문의해주세요 : dto parameter is null';
    }
    if (StringUtil.isEmpty(dealPatchDto.title)) {
      throw '제목을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPatchDto.category)) {
      throw '카테고리를 선택해주세요';
    }
    if (StringUtil.isEmpty(dealPatchDto.price)) {
      throw '가격을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPatchDto.description)) {
      throw '상품의 설명을 입력해주세요';
    }
    if (StringUtil.isEmpty(dealPatchDto.seller)) {
      throw '개발자에게 문의해주세요 : seller parameter is null';
    }
  }

  /// 사진 선택 모달 열기
  void _openPictureSelectionModal() async {
    final ImagePicker imagePicker = ImagePicker();

    return await showModalBottomSheet(
      context: context,
      builder: (BuildContext dialogContext) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text(CAMERA_SELECTION_TEXT),
                  onTap: () async {
                    // 카메라 화면 띄우기
                    try {
                      PickedFile pickedFile = await imagePicker.getImage(
                        source: ImageSource.camera,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          pictureList.add(File(pickedFile.path));
                        });
                      }
                    } catch (e) {
                      // 카메라 권한 확인
                      _checkCameraPermission();
                    }

                    Navigator.pop(dialogContext);
                  }
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text(GALLERY_SELECTION_TEXT),
                onTap: () async {
                  // 갤러리 화면 띄우기
                  try {
                    PickedFile pickedFile = await imagePicker.getImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        pictureList.add(File(pickedFile.path));
                      });
                    }
                  } catch (e) {
                    // 갤러리 권한 확인
                    _checkGalleryPermission();
                  }

                  Navigator.pop(dialogContext);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 카메라 권한 확인
  void _checkCameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.status;

    if (cameraStatus != PermissionStatus.granted) {
      await showDialog(
          context: context,
          builder: (BuildContext permissionDialogContext) {
            return PermissionSettingDialog(
                title: CAMERA_PERMISSION_DIALOG_TITLE,
                onCancel: () {
                  Navigator.pop(context);
                },
                onOk: () {
                  Navigator.pop(context);
                }
            );
          }
      );
    }
  }

  /// 갤러리 권한 확인
  void _checkGalleryPermission() async {
    PermissionStatus photosStatus = await Permission.photos.status;

    if (photosStatus != PermissionStatus.granted) {
      await showDialog(
          context: context,
          builder: (BuildContext permissionDialogContext) {
            return PermissionSettingDialog(
                title: GALLERY_PERMISSION_DIALOG_TITLE,
                onCancel: () {
                  Navigator.pop(context);
                },
                onOk: () {
                  Navigator.pop(context);
                }
            );
          }
      );
    }
  }
}
