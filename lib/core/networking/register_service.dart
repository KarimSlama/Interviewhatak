import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/model/register_request.dart';

abstract class RegisterService {
  const RegisterService();

  Future<ServerResult<String?>> register(RegisterRequestModel registerRequestModel);

  Future<String?> login(String email, String password);

  Future<void> signOut();
}
