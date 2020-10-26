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
    chats: (json['chats'] as List)
        ?.map((e) =>
            e == null ? null : ChatDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    seller: json['seller'] == null
        ? null
        : AccountDto.fromJson(json['seller'] as Map<String, dynamic>),
    sellerName: json['sellerName'] as String,
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
  writeNotNull('chats', instance.chats?.map((e) => e?.toJson())?.toList());
  writeNotNull('seller', instance.seller?.toJson());
  writeNotNull('sellerName', instance.sellerName);
  return val;
}
