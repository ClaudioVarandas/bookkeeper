import 'dart:async';

import 'package:dio/dio.dart';
import 'package:bookkeeper/data/remote/interceptors/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Credits to Flutter Portugal team
///
class RequestInterceptor {

  LoggingInterceptor _loggingInterceptor;

  RequestInterceptor(this._loggingInterceptor);

  /// Generates the Request Interceptor
  ///
  /// [requestOptions] request options
  Future<Options> getRequestInterceptor(Dio dio,Options requestOptions) async {

    _loggingInterceptor.printRequest(requestOptions);

    dio.lock();

    Future<dynamic> getToken = Future(() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token");
      String tokenType = prefs.getString("token_type");

      return accessToken != null ? '$tokenType $accessToken' : null;
    });

    return getToken.then((value) {
      if(value != null){
        requestOptions.headers["Authorization"] = value;
      }

      return requestOptions;
    }).whenComplete(() => dio.unlock()); // unlock the dio

  }
}