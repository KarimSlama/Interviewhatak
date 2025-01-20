import 'package:freezed_annotation/freezed_annotation.dart';
part 'setting_state.freezed.dart';

@freezed
class SettingState<T> with _$SettingState<T> {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.changed(bool isDark) = Changed;
  const factory SettingState.error({required String error}) = Error;
}
