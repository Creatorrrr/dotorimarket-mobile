// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDto _$UserLoginDtoFromJson(Map<String, dynamic> json) {
  return UserLoginDto(
    userId: json['userId'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserLoginDtoToJson(UserLoginDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('password', instance.password);
  return val;
}
