import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CategoryDto {
  String id;
  String name;

  CategoryDto({
    this.id,
    this.name,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}