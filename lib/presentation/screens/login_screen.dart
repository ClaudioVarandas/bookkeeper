import 'package:bookkeeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:bookkeeper/data/remote/services/auth_service.dart';
import 'package:bookkeeper/presentation/screens//home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  final AuthService authService;

  LoginScreen(this.authService);

  @override
  _LoginPageState createState() => new _LoginPageState(authService);
}

class _LoginPageState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService;

  _LoginPageState(this.authService);

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Container(
              child: Text(
                'Login',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              child: Text(
                'Welcome back',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 60.0),
            TextFormField(
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  authService
                      .doLogin(usernameController.text, passwordController.text)
                      .then((response) {
                    Navigator.pushNamed(context,routeHome);

                  }).catchError((error) {
                    print(error.toString());

                    Fluttertoast.showToast(
                        msg: "Invalid Login / Unauthorized.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        fontSize: 16.0);
                  });
                },
                padding: EdgeInsets.all(12),
                color: Colors.blueAccent,
                child: Text('Submit',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
