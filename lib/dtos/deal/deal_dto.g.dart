// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealDto _$DealDtoFromJson(Map<String, dynamic> json) {
  return DealDto(
    id: json['id'] as String,
    title: json['title'] as String,
    category: json['category'] == null
        ? null
        : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
    price: json['price'] as int,
    description: json['description'] as String,
    seller: json['seller'] == null
        ? null
        : AccountDto.fromJson(json['seller'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DealDtoToJson(DealDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('category', instance.category?.toJson());
  writeNotNull('price', instance.price);
  writeNotNull('description', instance.description);
  writeNotNull('seller', instance.seller?.toJson());
  return val;
}
