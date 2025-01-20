import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';

abstract class UserService {
  Future<ServerResult<UserModel>> getUser();

  Future<ServerResult<void>> updateUser(UserModel userModel);

  Future<void> signOut();
}
