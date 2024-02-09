import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/exceptions.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<Position> getCurrentLocation();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  const HomeLocalDataSourceImpl({
    required GeolocatorPlatform geolocator,
  }) : _geolocator = geolocator;
  final GeolocatorPlatform _geolocator;

  @override
  Future<Position> getCurrentLocation() async {
    try {
      //     final currentLocation = await LocationHelper.getCurrentLocation(
      // geolocator: _geolocator,
// );
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      // serviceEnabled = await geolocator.isLocationServiceEnabled();
      serviceEnabled = await _geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        throw const ServerException(
            message: 'Location services are disabled', statusCode: 505);
      }

      permission = await _geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await _geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          throw const ServerException(
              message: 'Location permissions are denied', statusCode: 505);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        throw const ServerException(
            message:
                'Location permissions are permanently denied, we cannot request permissions.',
            statusCode: 505);
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await _geolocator.getCurrentPosition();
    } on DioException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
