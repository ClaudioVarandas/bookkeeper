import 'package:bookkeeper/data/remote/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:bookkeeper/constants.dart';
import 'package:bookkeeper/di/network_dependencies.dart';
import 'package:bookkeeper/data/remote/endpoints/auth_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Credits to Flutter Portugal team
///
/// As an [InheritedWidget] this class will provide its childs the objects it hold
///
/// By accessing [of] and providing a [BuildContext] we can access, for example, the [Config] instance.
/// Usage: `var provider = DependencyProvider.of(context);`
class DependencyProvider extends InheritedWidget {


  DependencyProvider({Key key, Widget child,}) : super(key: key, child: child);

  AuthService _authService;
  AuthEndpoints _authEndpoints;

  SharedPreferences _sharedPreferences;

  AuthService getAuthService({bool forceCreation = false}) {
    if (_authService == null || forceCreation) {
      _authService = AuthService(_authEndpoints,_sharedPreferences);
    }
    return _authService;
  }


  /// Initializes app dependencies,
  Future<bool> initialize() async {
    // Storage Dependencies
    _sharedPreferences = await SharedPreferences.getInstance();
    // Interceptors
    var loggingInterceptor = getLoggingInterceptor();
    var errorInterceptor = getErrorInterceptor(loggingInterceptor);
    var responseInterceptor = getResponseInterceptor(loggingInterceptor);
    var requestInterceptor = getRequestInterceptor(loggingInterceptor);

    // network dependencies
    var dioOptions = createDioOptions(baseUrlProd, connectionTimeout, connectionReadTimeout);
    var dio = await createDio(dioOptions, errorInterceptor, responseInterceptor, requestInterceptor);

    // endpoints
    _authEndpoints = AuthEndpoints(dio);


    // Mappers

    // Managers

    debugPrint("initialized...");
  }

  /// Since we just want to create the dependencies once, at the start of the app, we won't need
  /// update this widget
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static DependencyProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DependencyProvider) as DependencyProvider);
  }
}
