import 'package:freezed_annotation/freezed_annotation.dart';
part 'contact_state.freezed.dart';

@freezed
class ContactState<T> with _$ContactState<T> {
  const factory ContactState.initial() = _Initial;

  const factory ContactState.loading() = Loading;

  const factory ContactState.success() = Success;

  const factory ContactState.error({required String error}) = Error;
}
