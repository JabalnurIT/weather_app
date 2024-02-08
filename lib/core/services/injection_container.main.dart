part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  final dio = Dio();
  final api = API();
  final imagePicker = ImagePicker();
  final geolocator = GeolocatorPlatform.instance;
  final filePicker = FilePicker.platform;

  await _initCore(
      prefs: prefs,
      dio: dio,
      api: api,
      imagePicker: imagePicker,
      geolocator: geolocator,
      filePicker: filePicker);

  await _initScanner();
}

Future<void> _initCore({
  required SharedPreferences prefs,
  required Dio dio,
  required API api,
  required ImagePicker imagePicker,
  required GeolocatorPlatform geolocator,
  required FilePicker filePicker,
}) async {
  sl
    ..registerLazySingleton(() => dio)
    ..registerLazySingleton(() => api)
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => imagePicker)
    ..registerLazySingleton(() => geolocator)
    ..registerLazySingleton(() => filePicker);
}

Future<void> _initScanner() async {
  sl.registerFactory(
    () => WeatherBloc(),
  );
}
