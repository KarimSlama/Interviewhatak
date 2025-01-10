import 'package:freezed_annotation/freezed_annotation.dart';
part 'field_state.freezed.dart';

@freezed
class FieldState<T> with _$FieldState<T> {
  const factory FieldState.initial() = _Initial;
  const factory FieldState.loading() = Loading;
  const factory FieldState.success(List<T> data) = Success;
  const factory FieldState.error(String error) = Error;
}
