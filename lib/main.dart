import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Home/AppleSignIn.dart';
import 'package:i_space/Login/LogInPage.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:provider/provider.dart';


class AppleSignInAvailable {
  AppleSignInAvailable(this.isAvailable);
  final bool isAvailable;

  static Future<AppleSignInAvailable> check() async {
    return AppleSignInAvailable(await AppleSignIn.isAvailable());
  }
}

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;


void main() async {
  // Fix for: Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized.
  WidgetsFlutterBinding.ensureInitialized();
  final appleSignInAvailable = await AppleSignInAvailable.check();
  Firebase.initializeApp();
  runApp(Provider<AppleSignInAvailable>.value(
    value: appleSignInAvailable,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (_) => AuthService(),
      child: MaterialApp(

        home: LoginPage( ),
      ),
    );
  }
}
