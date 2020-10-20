
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Login/LogInPage.dart';
import 'package:i_space/Views/Pictures.dart';
import 'package:i_space/main.dart';

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

            await FirebaseAuth.instance.signOut();
            Navigator
                .of(context)
                .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
          }
          ),
          Text(
            'Space',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {
            if (currentIndex == 0){
              print('add to pictures');
            }
            else if (currentIndex == 1){
              print('add to Video');
            }
            else if (currentIndex == 2){
              print('add to Settings');
              
            }
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}


