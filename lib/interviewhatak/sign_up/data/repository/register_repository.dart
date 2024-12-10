import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interviewhatak/core/networking/register_service.dart';
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
        image: "https://avatars.githubusercontent.com/u/96607967?v=4",
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
