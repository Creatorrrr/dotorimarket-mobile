
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

  AccountDto({
    this.id,
    this.accountId,
    this.password,
    this.name,
    this.email,
    this.place,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}
