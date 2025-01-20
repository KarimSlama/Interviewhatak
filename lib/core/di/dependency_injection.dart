import 'package:get_it/get_it.dart';
import 'package:interviewhatak/core/networking/categories/category_service.dart';
import 'package:interviewhatak/core/networking/categories/category_service_imp.dart';
import 'package:interviewhatak/core/networking/contact/contact_service.dart';
import 'package:interviewhatak/core/networking/contact/contact_service_impl.dart';
import 'package:interviewhatak/core/networking/favorite/favorite_service.dart';
import 'package:interviewhatak/core/networking/favorite/favorite_service_impl.dart';
import 'package:interviewhatak/core/networking/fields/fields_service.dart';
import 'package:interviewhatak/core/networking/fields/fields_service_impl.dart';
import 'package:interviewhatak/core/networking/questions/question_service.dart';
import 'package:interviewhatak/core/networking/questions/question_service_impl.dart';
import 'package:interviewhatak/core/networking/register/register_service.dart';
import 'package:interviewhatak/core/networking/register/register_service_impl.dart';
import 'package:interviewhatak/core/networking/sections/section_service.dart';
import 'package:interviewhatak/core/networking/sections/section_service_impl.dart';
import 'package:interviewhatak/core/networking/users/user_service.dart';
import 'package:interviewhatak/core/networking/users/user_service_impl.dart';
import 'package:interviewhatak/interviewhatak/contact_us/controller/cubit/contact_cubit.dart';
import 'package:interviewhatak/interviewhatak/contact_us/data/repository/contact_repository.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/data/repository/category_repo.dart';
import 'package:interviewhatak/interviewhatak/favorites/controller/favorite_cubit.dart';
import 'package:interviewhatak/interviewhatak/favorites/data/repository/favorite_repository.dart';
import 'package:interviewhatak/interviewhatak/field/controller/field_cubit.dart';
import 'package:interviewhatak/interviewhatak/field/data/repository/fields_repository.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';
import 'package:interviewhatak/interviewhatak/login/data/repository/login_repository.dart';
import 'package:interviewhatak/interviewhatak/profile/controller/user_cubit.dart';
import 'package:interviewhatak/interviewhatak/profile/data/repository/user_repository.dart';
import 'package:interviewhatak/interviewhatak/question/controller/cubit/question_cubit.dart';
import 'package:interviewhatak/interviewhatak/question/data/repository/question_repository.dart';
import 'package:interviewhatak/interviewhatak/section/controller/cubit/section_cubit.dart';
import 'package:interviewhatak/interviewhatak/section/data/repository/section_repository.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/repository/register_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  ///REGISTER SERVICE
  getIt.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

  ///CATEGORIES SERVICE
  getIt.registerLazySingleton<CategoryService>(() => CategoryServiceImpl());

  ///REGISTER
  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepository(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  ///LOGIN
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());

  ///CATEGORIES
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  ///Fields
  getIt.registerLazySingleton<FieldsService>(() => FieldsServiceImpl());
  getIt
      .registerLazySingleton<FieldsRepository>(() => FieldsRepository(getIt()));
  getIt.registerFactory<FieldCubit>(() => FieldCubit(getIt()));

  ///Sections
  getIt.registerLazySingleton<SectionService>(() => SectionServiceImpl());
  getIt.registerLazySingleton<SectionRepository>(
      () => SectionRepository(getIt()));
  getIt.registerFactory<SectionCubit>(() => SectionCubit(getIt()));

  ///Questions
  getIt.registerLazySingleton<QuestionService>(() => QuestionServiceImpl());
  getIt.registerLazySingleton<QuestionRepository>(
      () => QuestionRepository(getIt()));
  getIt.registerFactory<QuestionCubit>(() => QuestionCubit(getIt()));

  ///Favorite Questions
  getIt.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl());
  getIt.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepository(getIt()));
  getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(getIt()));

  ///Profile
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt()));
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));

  ///Contact
  getIt.registerLazySingleton<ContactService>(() => ContactServiceImpl());
  getIt.registerLazySingleton<ContactRepository>(
      () => ContactRepository(getIt()));
  getIt.registerFactory<ContactCubit>(() => ContactCubit(getIt()));
}
