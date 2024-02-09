// api_headers.dart

import 'package:dio/dio.dart';

class ApiHeaders {
  static Options getHeaders({
    Map<String, String>? additionalHeaders,
  }) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    if (additionalHeaders != null && additionalHeaders.isNotEmpty) {
      headers.addAll(additionalHeaders);
    }

    return Options(headers: headers);
  }
}
