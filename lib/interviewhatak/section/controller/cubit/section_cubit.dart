import 'package:bloc/bloc.dart';
import 'package:interviewhatak/interviewhatak/section/controller/cubit/section_state.dart';
import 'package:interviewhatak/interviewhatak/section/data/model/sections_model.dart';
import 'package:interviewhatak/interviewhatak/section/data/repository/section_repository.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepository sectionRepository;
  SectionCubit(this.sectionRepository) : super(SectionState.initial());

  List<SectionsModel> sections = [];
  Future<void> getSections(String fieldName) async {
    emit(SectionState.loading());
    final result = await sectionRepository.getSections(fieldName);
    result.when(
      success: (data) {
        sections = [];
        sections = data;
        emit(SectionState.success(data));
      },
      failure: (error) {
        emit(SectionState.error(error));
      },
    );
  }
}
