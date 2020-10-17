import 'package:json_annotation/json_annotation.dart';

part 'word_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class WordDto {
  String id;
  String name;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  WordDto({
    this.id,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory WordDto.fromJson(Map<String, dynamic> json) => _$WordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WordDtoToJson(this);
}