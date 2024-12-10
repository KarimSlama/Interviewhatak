import 'package:get_it/get_it.dart';
import 'package:interviewhatak/core/networking/register_service.dart';
import 'package:interviewhatak/core/networking/register_service_impl.dart';
import 'package:interviewhatak/interviewhatak/login/controller/login_cubit.dart';
import 'package:interviewhatak/interviewhatak/login/data/repository/login_repository.dart';
import 'package:interviewhatak/interviewhatak/sign_up/controller/register_cubit.dart';
import 'package:interviewhatak/interviewhatak/sign_up/data/repository/register_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  ///REGISTER SERVICE
  getIt.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

  ///REGISTER
  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepository(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  ///LOGIN
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
