import 'package:interviewhatak/core/networking/register_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/login/data/model/login_request_model.dart';

class LoginRepository {
  final RegisterService registerService;

  LoginRepository(this.registerService);

  Future<ServerResult<String?>> login(String email, String password) async {
    LoginRequestModel loginRequestModel =
        LoginRequestModel(email: email, password: password);

    ServerResult<String?> result =
        await registerService.login(loginRequestModel);

    return result.when(
      success: (uId) => ServerResult.success(uId),
      failure: (error) => ServerResult.failure(error),
    );
  }
}
