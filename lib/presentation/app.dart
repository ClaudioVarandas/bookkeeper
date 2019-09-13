import 'package:flutter/material.dart';
import 'package:bookkeeper/di/dependency_provider.dart';
import 'package:bookkeeper/presentation/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookkeeper/presentation/screens/home_screen.dart';
import 'package:bookkeeper/presentation/screens/login_screen.dart';
import 'package:bookkeeper/presentation/screens/scan_screen.dart';
import 'package:bookkeeper/constants.dart';
import 'package:bookkeeper/styles.dart';


class BookkeeperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookkeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: mainBlue,
        fontFamily: 'SF Pro Display',
      ),
      initialRoute: routeSplash,
      routes: {
        routeSplash: (context) {
          return SplashScreen();
        },
        routeHome: (context) {
          return HomeScreen();
        },
        routeScan: (context) {
          return ScanScreen();
        },
        routeLogin: (context) {
          var authService = DependencyProvider.of(context).getAuthService();
          return LoginScreen(authService);
        },
        routeLogout: (context) {
          SharedPreferences.getInstance().then((prefs) {
            prefs.clear();
          });
          return SplashScreen();
        },
      },
    );
  }
}
