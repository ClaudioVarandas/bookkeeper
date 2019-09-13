import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {


  @override
  _ScanPageState createState() => new _ScanPageState();
}

class _ScanPageState extends State<ScanScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Center(
        child: Text("Scans"),
      ),
    );
  }
}
