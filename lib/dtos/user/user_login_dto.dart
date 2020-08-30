
import 'package:json_annotation/json_annotation.dart';

part 'user_login_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UserLoginDto {
  String userId;
  String password;

  UserLoginDto({
    this.userId,
    this.password,
  });

  factory UserLoginDto.fromJson(Map<String, dynamic> json) => _$UserLoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginDtoToJson(this);
}
