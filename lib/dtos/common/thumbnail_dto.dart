import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ThumbnailDto {
  String filename;
  String path;

  ThumbnailDto({
    this.filename,
    this.path,
  });

  factory ThumbnailDto.fromJson(Map<String, dynamic> json) => _$ThumbnailDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailDtoToJson(this);
}