import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/src/home/data/datasources/home_local_data_source.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  late GeolocatorPlatform geolocator;
  late HomeLocalDataSourceImpl dataSource;

  setUp(() {
    geolocator = MockGeolocator();
    dataSource = HomeLocalDataSourceImpl(
      geolocator: geolocator,
    );
  });
  final tLocation = Position(
    latitude: 1.0,
    longitude: 1.0,
    timestamp: DateTime.now(),
    accuracy: 1.0,
    altitude: 1.0,
    heading: 1.0,
    speed: 1.0,
    speedAccuracy: 1.0,
    altitudeAccuracy: 1.0,
    headingAccuracy: 1.0,
  );
  group(
    'getCurrentLocation',
    () {
      test('should complete successfully when no [Exception] is thrown',
          () async {
        when(
          () => geolocator.isLocationServiceEnabled(),
        ).thenAnswer((_) async => Future.value(true));

        when(
          () => geolocator.checkPermission(),
        ).thenAnswer((_) async => Future.value(LocationPermission.always));

        when(
          () => geolocator.getCurrentPosition(),
        ).thenAnswer((_) async => Future.value(tLocation));

        final result = await dataSource.getCurrentLocation();

        expect(result, equals(tLocation));

        verify(
          () => geolocator.isLocationServiceEnabled(),
        ).called(1);
        verify(
          () => geolocator.checkPermission(),
        ).called(1);
        verify(
          () => geolocator.getCurrentPosition(),
        ).called(1);
        verifyNoMoreInteractions(geolocator);
      });

      test(
          'should throw [ServerException] when '
          '[locationService] is disabled', () async {
        when(
          () => geolocator.isLocationServiceEnabled(),
        ).thenAnswer((_) async => Future.value(false));

        final call = dataSource.getCurrentLocation;
        expect(
          () => call(),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => geolocator.isLocationServiceEnabled(),
        ).called(1);
        verifyNoMoreInteractions(geolocator);
      });

      test(
          'should throw [ServerException] when '
          '[permission] is denied', () async {
        when(
          () => geolocator.isLocationServiceEnabled(),
        ).thenAnswer((_) async => Future.value(true));

        when(
          () => geolocator.checkPermission(),
        ).thenAnswer((_) async => Future.value(LocationPermission.denied));

        when(
          () => geolocator.requestPermission(),
        ).thenAnswer((_) async => Future.value(LocationPermission.denied));

        final call = dataSource.getCurrentLocation;
        expect(
          () => call(),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => geolocator.isLocationServiceEnabled(),
        ).called(1);

        verifyNoMoreInteractions(geolocator);
      });

      test(
          'should throw [ServerException] when '
          '[permission] is deniedForever', () async {
        when(
          () => geolocator.isLocationServiceEnabled(),
        ).thenAnswer((_) async => Future.value(true));

        when(
          () => geolocator.checkPermission(),
        ).thenAnswer(
            (_) async => Future.value(LocationPermission.deniedForever));

        final call = dataSource.getCurrentLocation;
        expect(
          () => call(),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => geolocator.isLocationServiceEnabled(),
        ).called(1);

        verifyNoMoreInteractions(geolocator);
      });
    },
  );
}
