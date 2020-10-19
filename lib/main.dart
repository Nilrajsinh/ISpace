import 'package:flutter/material.dart';
import 'package:i_space/Login/LogInPage.dart';

void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage( ),
    );
  }
}
