// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealPostDto _$DealPostDtoFromJson(Map<String, dynamic> json) {
  return DealPostDto(
    title: json['title'] as String,
    category: json['category'] as String,
    price: json['price'] as String,
    status: json['status'] as String,
    description: json['description'] as String,
    seller: json['seller'] as String,
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
  writeNotNull('category', instance.category);
  writeNotNull('price', instance.price);
  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  writeNotNull('seller', instance.seller);
  return val;
}
