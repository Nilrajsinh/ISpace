import 'package:flutter/material.dart';
import 'package:i_space/Views/Pictures.dart';
import 'package:i_space/Views/Settings.dart';
import 'package:i_space/Views/Video.dart';
import 'package:i_space/Widget/AppBar.dart';
import 'package:i_space/Widget/Custom_Navigation_Bar.dart';
import 'package:i_space/main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      extendBody: true,
      appBar: CustomAppBar(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          Pictures(),
          Videos(),
          Settings(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
