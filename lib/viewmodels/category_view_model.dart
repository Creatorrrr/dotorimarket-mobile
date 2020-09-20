import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';

class CategoryViewModel extends ViewModel {
  static const GET_CATEGORY_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/categories';

  Future<List<CategoryDto>> getCategoryList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_CATEGORY_LIST;

    Map<String, String> queryParams = {
      filter: filter,
      field: field,
      keyword: keyword,
      orders: orders,
      paging: paging,
    };

    // Response res = await HttpUtil.get(url, context,
    //   queryParams: queryParams,
    // );
    // Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<CategoryDto> categoryList = [
      CategoryDto(
        categoryId: 1,
        name: '디지털/가전',
      ),
      CategoryDto(
        categoryId: 2,
        name: '가구/인테리어',
      ),
      CategoryDto(
        categoryId: 3,
        name: '유아동/유아도서',
      ),
      CategoryDto(
        categoryId: 4,
        name: '생활/가공식품',
      ),
      CategoryDto(
        categoryId: 5,
        name: '스포츠/레저',
      ),
      CategoryDto(
        categoryId: 6,
        name: '여성잡화',
      ),
      CategoryDto(
        categoryId: 7,
        name: '여성의류',
      ),
      CategoryDto(
        categoryId: 8,
        name: '남성패션/잡화',
      ),
      CategoryDto(
        categoryId: 9,
        name: '게임/취미',
      ),
      CategoryDto(
        categoryId: 10,
        name: '뷰티/미용',
      ),
      CategoryDto(
        categoryId: 11,
        name: '반려동물용품',
      ),
      CategoryDto(
        categoryId: 12,
        name: '도서/티켓/음반',
      ),
      CategoryDto(
        categoryId: 13,
        name: '기타 중고물품',
      ),
    ];
    // for (dynamic json in bodyJson['result']) {
    //   CategoryDto categoryDto = new CategoryDto.fromJson(json);
    //   categoryList.add(categoryDto);
    // }

    return categoryList;
  }
}