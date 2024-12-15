import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/interviewhatak/notification/notification_screen.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_state.dart';
import 'package:interviewhatak/interviewhatak/favorites/favorite_screen.dart';
import 'package:interviewhatak/interviewhatak/category/category_screen.dart';
import 'package:interviewhatak/interviewhatak/profile/profile_screen.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  int currentIndex = 0;

  List<Widget> screens = [
    CategoryScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void changeDashboardScreen(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(DashboardState.changed(currentIndex));
    }
  }
}
