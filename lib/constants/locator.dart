
import 'package:atik/constants/apis.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> locator() async {
  getIt
    ..registerLazySingleton<SecureStorage>(SecureStorage.new)
    ..registerLazySingleton<Dio>(() => ApiService().init())
    ..registerLazySingleton<Dio>(
      () => ApiService(isMacellan: true).init(),
      instanceName: 'macellanDio',
    );

}