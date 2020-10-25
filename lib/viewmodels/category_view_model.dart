import 'dart:convert';

import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/category/category_dto.dart';
import 'package:dotorimarket/utils/http_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'package:dotorimarket/viewmodels/view_model.dart';
import 'package:sprintf/sprintf.dart';

class CategoryViewModel extends ViewModel {
  static const GET_CATEGORY_ONE = '${HttpConfig.URL_MOBILE_PREFIX}/v1/categories/%s';
  static const GET_CATEGORY_LIST = '${HttpConfig.URL_MOBILE_PREFIX}/v1/categories';

  Future<CategoryDto> getCategoryOne(String categoryId, BuildContext context) async {
    String url = sprintf(GET_CATEGORY_ONE, [categoryId]);

    Response res = await HttpUtil.get(url, context);
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    CategoryDto category = new CategoryDto.fromJson(bodyJson['result']);

    return category;
  }

  Future<List<CategoryDto>> getCategoryList(String filter, String field, String keyword, String orders, String paging, BuildContext context) async {
    String url = GET_CATEGORY_LIST;

    Map<String, String> queryParams = {
      'filter': filter,
      'field': field,
      'keyword': keyword,
      'orders': orders,
      'paging': paging,
    };

    Response res = await HttpUtil.get(url, context,
      queryParams: queryParams,
    );
    Map<String, dynamic> bodyJson = jsonDecode(res.body);

    List<CategoryDto> categoryList = [];
    for (dynamic json in bodyJson['result']) {
      CategoryDto categoryDto = new CategoryDto.fromJson(json);
      categoryList.add(categoryDto);
    }

    return categoryList;
  }
}