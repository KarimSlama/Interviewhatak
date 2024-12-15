import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/networking/register/register_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/model/register_request.dart';

class RegisterRepository {
  final RegisterService registerService;

  RegisterRepository(this.registerService);

  Future<ServerResult<String?>> registerNewUser(
      String name, String email, String phone, String password) async {
    try {
      RegisterRequestModel registerRequestModel = RegisterRequestModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
        uId: '',
        image:
            "https://img.freepik.com/free-vector/blond-man-blue-eyes_24877-83661.jpg?t=st=1734292536~exp=1734296136~hmac=eed09f65b93195f94235d9f0f258f080d4df74d017b6fbcef88e24f3a67e4972&w=740",
      );
      ServerResult<String?> result =
          await registerService.register(registerRequestModel);

      return result.when(success: (uId) {
        registerRequestModel = registerRequestModel.copyWith(uId: uId);
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .set(registerRequestModel.toJson());
        return ServerResult.success(uId);
      }, failure: (error) {
        return ServerResult.failure(error);
      });
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
