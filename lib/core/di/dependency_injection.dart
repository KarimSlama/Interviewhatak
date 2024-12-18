import 'package:get_it/get_it.dart';
import 'package:interviewhatak/core/networking/categories/category_service.dart';
import 'package:interviewhatak/core/networking/categories/category_service_imp.dart';
import 'package:interviewhatak/core/networking/register/register_service.dart';
import 'package:interviewhatak/core/networking/register/register_service_impl.dart';
import 'package:interviewhatak/interviewhatak/dashboard/controller/dashboard_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/controller/category_cubit.dart';
import 'package:interviewhatak/interviewhatak/category/data/repository/category_repo.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';
import 'package:interviewhatak/interviewhatak/login/data/repository/login_repository.dart';
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

  ///Categoris
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
}
