import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/login/data/model/login_request_model.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/model/register_request.dart';

abstract class RegisterService {
  const RegisterService();

  Future<ServerResult<String?>> register(
      RegisterRequestModel registerRequestModel);

  Future<ServerResult<String?>> login(LoginRequestModel loginRequestModel);

  Future<void> signOut();
}
