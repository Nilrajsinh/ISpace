
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Login/LogInPage.dart';
import 'package:i_space/Views/Pictures.dart';
import 'package:i_space/main.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final double _preferredHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomCenter,

      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[400],
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () async{

          }
          ),
          Text(
            'Photos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {

          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

class CustomSettingBar extends StatelessWidget implements PreferredSizeWidget {

  final double _preferredHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomCenter,

      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[400],
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

class CustomAppBarVideo extends StatelessWidget implements PreferredSizeWidget {

  final double _preferredHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.bottomCenter,

      decoration: BoxDecoration(

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue[400],
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () async{


          }
          ),
          Text(
            'Video',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {


            }
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

