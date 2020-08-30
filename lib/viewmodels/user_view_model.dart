import 'package:dotorimarket/configs/http_config.dart';
import 'package:dotorimarket/dtos/user/user_login_dto.dart';
import 'package:http/http.dart' as http;
import 'package:dotorimarket/viewmodels/view_model.dart';

class UserViewModel extends ViewModel {
  static const POST_USER = '${HttpConfig.URL_PREFIX}/v1/users';

  UserViewModel();

  Future<http.Response> postUser(UserLoginDto userLoginDto) async {
    http.Response res = await http.post(
      POST_USER,
      body: userLoginDto.toJson(),
    );
    return res;
  }
}