import 'package:freezed_annotation/freezed_annotation.dart';
part 'section_state.freezed.dart';

@freezed
class SectionState<T> with _$SectionState<T> {
  const factory SectionState.initial() = _Initial;
  const factory SectionState.loading() = Loading;
  const factory SectionState.success(T data) = Success;
  const factory SectionState.error(String error) = Error;
}
