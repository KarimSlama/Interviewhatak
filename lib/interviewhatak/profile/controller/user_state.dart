import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interviewhatak/interviewhatak/profile/data/model/user_model.dart';
part 'user_state.freezed.dart';

@freezed
class UserState<T> with _$UserState<T> {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.loaded(UserModel users) = Loaded;
  const factory UserState.out(UserModel users) = Out;
  const factory UserState.error(String message) = Error;
}
