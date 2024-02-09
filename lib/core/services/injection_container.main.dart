part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio();
  final api = API();
  final geolocator = GeolocatorPlatform.instance;

  await _initCore(
    dio: dio,
    api: api,
    geolocator: geolocator,
  );

  await _initHome();
}

Future<void> _initCore({
  required Dio dio,
  required API api,
  required GeolocatorPlatform geolocator,
}) async {
  sl
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => api)
    ..registerLazySingleton(() => geolocator);
}

Future<void> _initHome() async {
  sl
    ..registerFactory(
      () => HomeBloc(
        getCurrentWeather: sl(),
        getDailyForecast: sl(),
        getHourlyForecast: sl(),
      ),
    )
    ..registerLazySingleton(() => GetCurrentWeather(sl()))
    ..registerLazySingleton(() => GetDailyForecast(sl()))
    ..registerLazySingleton(() => GetHourlyForecast(sl()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
          sl(),
          sl(),
        ))
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        dio: sl(),
        api: sl(),
      ),
    )
    ..registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(
        geolocator: sl(),
      ),
    );
}
