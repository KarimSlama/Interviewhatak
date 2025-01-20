import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/core/networking/users/user_service.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<ServerResult<UserModel>> getUser() async {
    return await userService.getUser();
  }

  Future<ServerResult<void>> updateUser(UserModel user) async {
    return await userService.updateUser(user);
  }

  Future<void> signOut() async {
    return await userService.signOut();
  }
}
