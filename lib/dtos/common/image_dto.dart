import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ImageDto {
  String originalname;
  String mimetype;
  String destination;
  String filename;
  String path;
  int size;

  ImageDto({
    this.originalname,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}