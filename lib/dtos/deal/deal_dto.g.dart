// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealDto _$DealDtoFromJson(Map<String, dynamic> json) {
  return DealDto(
    dealId: json['dealId'] as int,
    title: json['title'] as String,
    categoryId: json['categoryId'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$DealDtoToJson(DealDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dealId', instance.dealId);
  writeNotNull('title', instance.title);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('price', instance.price);
  writeNotNull('description', instance.description);
  return val;
}
