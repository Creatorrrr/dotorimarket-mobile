
import 'package:json_annotation/json_annotation.dart';

part 'deal_patch_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class DealPatchDto {
  String title;
  String category;
  String price;
  String status;
  String description;
  String seller;

  DealPatchDto({
    this.title,
    this.category,
    this.price,
    this.status,
    this.description,
    this.seller,
  });

  factory DealPatchDto.fromJson(Map<String, dynamic> json) => _$DealPatchDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DealPatchDtoToJson(this);
}
