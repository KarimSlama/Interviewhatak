import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/core/helpers/shared_preference.dart';
import 'package:interviewhatak/interviewhatak/settings/controller/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  bool isDark = false;

  void changeMode(bool? value) {
    if (value != null) {
      isDark = value;
    } else {
      isDark = !isDark;
    }
    emit(SettingState.changed(isDark));

    SharedPreference.setData('isDark', isDark);
  }
}
