// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealPostDto _$DealPostDtoFromJson(Map<String, dynamic> json) {
  return DealPostDto(
    title: json['title'] as String,
    categoryId: json['categoryId'] as String,
    price: json['price'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DealPostDtoToJson(DealPostDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('price', instance.price);
  writeNotNull('description', instance.description);
  return val;
}
