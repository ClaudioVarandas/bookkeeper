import 'package:dio/dio.dart';
import 'package:bookkeeper/data/remote/interceptors/logging_interceptor.dart';

/// Credits to Flutter Portugal team
/// see https://github.com/vostpt/mobile-app/blob/develop/lib/di/dependency_provider.dart
///
class ResponseInterceptor {
  LoggingInterceptor _loggingInterceptor;

  ResponseInterceptor(this._loggingInterceptor);

  /// Intercepts the response so that we can validate its integrity
  Response getResponseInterceptor(Response response) {
    _loggingInterceptor.printSuccess(response);
    return response;
  }
}
