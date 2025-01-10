import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/interviewhatak/field/controller/field_state.dart';
import 'package:interviewhatak/interviewhatak/field/data/model/fields_model.dart';
import 'package:interviewhatak/interviewhatak/field/data/repository/fields_repository.dart';

class FieldCubit extends Cubit<FieldState> {
  final FieldsRepository fieldsRepository;

  FieldCubit(this.fieldsRepository) : super(FieldState.initial());

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<FieldsModel> fields = [];

  Future<void> loadFields(String categoryName) async {
    emit(FieldState.loading());

    final result = await fieldsRepository.fetchFieldsData(categoryName);
    result.when(
      success: (data) async {
        for (var i = 0; i < data.length; i++) {
          await Future.delayed(const Duration(milliseconds: 150));
          fields.add(data[i % data.length]);
          listKey.currentState?.insertItem(i);
          emit(FieldState.success(fields));
        }
      },
      failure: (error) => emit(FieldState.error(error)),
    );
  }
}
