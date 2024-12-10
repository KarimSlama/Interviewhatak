import 'package:firebase_auth/firebase_auth.dart';
import 'package:interviewhatak/core/networking/register_service.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/model/register_request.dart';

class RegisterServiceImpl implements RegisterService {
  @override
  Future<ServerResult<String?>> register(
      RegisterRequestModel registerRequestModel) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      );

      String uid = userCredential.user!.uid;
      return ServerResult.success(uid);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<String?> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
