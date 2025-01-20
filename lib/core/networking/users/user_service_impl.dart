import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interviewhatak/core/networking/server_result.dart';
import 'package:interviewhatak/core/networking/users/user_service.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Future<ServerResult<UserModel>> getUser() async {
    try {
      if (user != null) {
        final userId = user?.uid;
        final docSnapshot =
            await _firebaseFirestore.collection('users').doc(userId).get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data()!;
          final user = UserModel(
              name: data['name'],
              email: data['email'],
              phone: data['phone'],
              image: data['image']);
          return ServerResult.success(user);
        }
      }
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
    return ServerResult.failure("error happend");
  }

  @override
  Future<ServerResult<void>> updateUser(UserModel userModel) async {
    try {
      if (user != null) {
        final userId = user?.uid;
        final userRef = _firebaseFirestore.collection('users').doc(userId);
        final response = await userRef.update({
          'name': userModel.name,
          'email': userModel.email,
          'phone': userModel.phone,
          'image': userModel.image,
        });
        return ServerResult.success(response);
      }
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
    return ServerResult.failure('Error Happed');
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
