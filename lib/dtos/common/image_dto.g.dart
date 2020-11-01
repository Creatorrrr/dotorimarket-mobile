// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) {
  return ImageDto(
    originalname: json['originalname'] as String,
    mimetype: json['mimetype'] as String,
    destination: json['destination'] as String,
    filename: json['filename'] as String,
    path: json['path'] as String,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('originalname', instance.originalname);
  writeNotNull('mimetype', instance.mimetype);
  writeNotNull('destination', instance.destination);
  writeNotNull('filename', instance.filename);
  writeNotNull('path', instance.path);
  writeNotNull('size', instance.size);
  return val;
}
