// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailDto _$ThumbnailDtoFromJson(Map<String, dynamic> json) {
  return ThumbnailDto(
    filename: json['filename'] as String,
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$ThumbnailDtoToJson(ThumbnailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filename', instance.filename);
  writeNotNull('path', instance.path);
  return val;
}
