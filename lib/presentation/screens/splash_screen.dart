import 'package:bookkeeper/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    boot();
  }

  Future<Timer> boot() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(!prefs.containsKey('is_authenticated')){
      Navigator.of(context).pushNamed(routeLogin);
    }else{
      bool isAuth = prefs.getBool('is_authenticated');

      if(isAuth){
        Navigator.of(context).pushNamed(routeHome);
      }else{
        Navigator.of(context).pushNamed(routeLogin);
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash.jpg'),
            fit: BoxFit.cover
        ) ,
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
        ),
      ),
    );
  }
}