import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _getnavyBar(context),
    );
  }
}


_getnavyBar(context){
  return Stack(
    children: [
      Positioned(
        bottom: 0,

          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  colors: [

                    Colors.blue[200],
                    Colors.blue[50],
                  ]

                )
              ),
            ),
          )
      )
    ],
  );
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo( 3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo( 5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo( 7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo( 9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo( 11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);


    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}