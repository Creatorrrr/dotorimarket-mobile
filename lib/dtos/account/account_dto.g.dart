// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return AccountDto(
    id: json['id'] as String,
    accountId: json['accountId'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    place: json['place'] as String,
    img: json['img'] == null
        ? null
        : ImageDto.fromJson(json['img'] as Map<String, dynamic>),
    thumbnail: json['thumbnail'] == null
        ? null
        : ThumbnailDto.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('accountId', instance.accountId);
  writeNotNull('password', instance.password);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('place', instance.place);
  writeNotNull('img', instance.img?.toJson());
  writeNotNull('thumbnail', instance.thumbnail?.toJson());
  return val;
}
