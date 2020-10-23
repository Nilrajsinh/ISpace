import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Login/LogInPage.dart';
import 'package:i_space/Widget/AppBar.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override

  _launchURLInsta() async {
    const url = 'https://instagram.com/ebrious._?igshid=4or13css9de6';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('About Us', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 4,),
            Text('Welcome To Space, We provide unlimited Space for your photos and video , Why to pay money to buy space for our memories. Store safe and securely into space, You can delete your account any time we dont share your Personal deatil to anyone',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.only(left:22.0,right: 22),
              child: Divider(height: 12,
              color: Colors.blue,
              ),
            ),

            Center(
              child: FlatButton(
                minWidth: 300,
                  onPressed: (){

              }, child: Text('Delete My Account..', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),)),

            ),
            Padding(
              padding: const EdgeInsets.only(left:22.0,right: 22),
              child: Divider(height: 12,
                color: Colors.blue,
              ),
            ),

            Center(
              child: FlatButton(
                  minWidth: 300,
                  onPressed: (){
                    _launchURLInsta();
                  }, child: Text('Follow Us On Insta', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),)),

            ),
            Padding(
              padding: const EdgeInsets.only(left:22.0,right: 22),
              child: Divider(height: 12,
                color: Colors.blue,
              ),
            ),
            Center(
              child: FlatButton(
                  minWidth: 300,
                  onPressed: (){
                    Share.share('https://play.google.com/store/apps/details?id=com.ebrious.com.ebrious.iscanner');
                  }, child: Text('Invite Others', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),)),

            ),
            Padding(
              padding: const EdgeInsets.only(left:22.0,right: 22),
              child: Divider(height: 12,
                color: Colors.blue,
              ),
            ),
            Center(
              child: FlatButton(
                  minWidth: 300,
                  onPressed: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator
                        .of(context)
                        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                  }, child: Text('Sign Out', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),)),

            ),
            Padding(
              padding: const EdgeInsets.only(left:22.0,right: 22),
              child: Divider(height: 12,
                color: Colors.blue,
              ),
            ),
            Spacer(),
            Center(child: Image.asset('Asset/Logo/SmallSize.png',height:70,fit: BoxFit.cover,)),


          ],
        ),
      )
    );
  }
}

