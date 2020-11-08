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
    status: json['status'] as String,
    description: json['description'] as String,
    chats: (json['chats'] as List)
        ?.map((e) =>
            e == null ? null : ChatDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    seller: json['seller'] == null
        ? null
        : AccountDto.fromJson(json['seller'] as Map<String, dynamic>),
    sellerName: json['sellerName'] as String,
    imgs: (json['imgs'] as List)
        ?.map((e) =>
            e == null ? null : ImageDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    thumbnails: (json['thumbnails'] as List)
        ?.map((e) =>
            e == null ? null : ThumbnailDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  writeNotNull('chats', instance.chats?.map((e) => e?.toJson())?.toList());
  writeNotNull('seller', instance.seller?.toJson());
  writeNotNull('sellerName', instance.sellerName);
  writeNotNull('imgs', instance.imgs?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'thumbnails', instance.thumbnails?.map((e) => e?.toJson())?.toList());
  return val;
}
