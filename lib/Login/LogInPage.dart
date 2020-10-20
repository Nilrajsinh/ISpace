import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Home/AppleSignIn.dart';
import 'package:i_space/Home/HomePage.dart';
import 'package:i_space/Login/GoogleSignIn.dart';
import 'package:i_space/main.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    final appleSignInAvailable =
    Provider.of<AppleSignInAvailable>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  height: 380,
                  child: Padding(
                    padding: const EdgeInsets.all(90.0),
                    child: Lottie.network("https://assets8.lottiefiles.com/packages/lf20_R6y0Xw.json"),
                  ),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(

                        colors: [
                          const Color(0xFF2980B9),
                          const Color(0xFF6DD5FA),
                          const Color(0xFFFFFFFF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        // stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  )
              ),
            ),
            Container(
              height: 30,
              child: Center(
                child: WavyAnimatedTextKit(
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.blue,
                    // fontFamily: 'BoldMain',
                  ),
                  text: [
                    "LOGIN",
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right:15.0,left: 15.0),
              child: Container(
                child: OutlineButton(
                  splashColor: Colors.grey,
                  onPressed: () {
                    // signInWithGoogle().then((result) {
                    //   if (result != null) {
                    //
                    //     Navigator
                    //         .of(context)
                    //         .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));
                    //   }
                    // });

                        Navigator
                            .of(context)
                            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage("Asset/Logo/google_PNG19635.png"), height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ),
            ),
            SizedBox(height: 10,),
            if (appleSignInAvailable.isAvailable)
              Container(
                child: OutlineButton(
                  splashColor: Colors.grey,
                  onPressed: () {
                    _signInWithApple(context);

                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Image(image: AssetImage("Asset/Logo/apple_logo_PNG19674.png"), height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Apple',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
             //  AppleSignInButton(
             // //   style: ButtonStyle.black, // style as needed
             //    type: ButtonType.signIn, // style as needed
             //    onPressed: () async{
             //
             //      _signInWithApple(context);
             //
             //
             //    },
             //  ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Container(
                  height: 90,
                  child: Image.asset('Asset/Logo/SmallSize.png')
              ),
            )
          ],
        ),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.30, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 75);
    var secondEndPoint = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Future<void> _signInWithApple(BuildContext context) async {
  try {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (await FirebaseAuth.instance.currentUser !=null)
      {
        print(FirebaseAuth.instance.currentUser.uid);
        Navigator
            .of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Home()));
      }
    // await authService.signInWithApple();

    final user = await authService.signInWithApple(
        scopes: [Scope.email, Scope.fullName]);

    print('uid: ${user.uid}');
  } catch (e) {
    // TODO: Show alert here
    print(e);
  }
}