import 'package:dio/dio.dart';
import 'package:bookkeeper/data/remote/interceptors/logging_interceptor.dart';

/// Credits to Flutter Portugal team
/// see https://github.com/vostpt/mobile-app/blob/develop/lib/di/dependency_provider.dart
///
class ErrorInterceptor {
  LoggingInterceptor _loggingInterceptor;

  ErrorInterceptor(this._loggingInterceptor);

  DioError getErrorInterceptors(DioError dioError) {
    if (checkConnection(dioError)) {
      return dioError;
    }

    _loggingInterceptor.printError(dioError);
    return dioError;
  }

  /// Method to verify if there is a problem connecting to the internet so that we can show a message
  /// to the user with the problem
  ///
  /// This is given by the Dio Error Type of `DEFAULT`
  bool checkConnection(DioError error) {
    if (error.type == DioErrorType.DEFAULT) {
      return true;
    }
    return false;
  }
}