
import 'package:dotorimarket/dtos/common/image_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AccountDto {
  String id;
  String accountId;
  String password;
  String name;
  String email;
  String place;
  ImageDto img;

  AccountDto({
    this.id,
    this.accountId,
    this.password,
    this.name,
    this.email,
    this.place,
    this.img,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}
