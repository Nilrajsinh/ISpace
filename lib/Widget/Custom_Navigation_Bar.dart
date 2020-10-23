import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Views/Pictures.dart';
import 'package:i_space/Views/Settings.dart';
import 'package:i_space/Views/Video.dart';
import 'package:i_space/Widget/AppBar.dart';


class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  int _selectedindex = 0;
  int _counter = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();


    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Container(
          child: SizedBox.expand(
            child: Container(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedindex = index);
                },
                children: <Widget>[
                  Container(child: InstagramSearchGrid()),
                  Container(child: InstagramSearchGridVideo(),),
                  Container(child: Settings(),),

                ],

              ),
            ),),
        ),

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedindex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (int index) { setState(() => _selectedindex = index);
          _pageController.jumpToPage(index); },
          items: [
            BottomNavyBarItem(

                icon: Icon(Icons.camera_alt),
                title: Text('Pictures'),
                activeColor: Colors.lightBlue[800],
                inactiveColor: Colors.lightBlue[400]
            ),
            BottomNavyBarItem(icon: Icon(Icons.movie),
                title: Text('Videos'),
                activeColor: Colors.lightBlue[800],
                inactiveColor: Colors.lightBlue[400]
            ),
            BottomNavyBarItem(icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.lightBlue[800],
                inactiveColor: Colors.lightBlue[400]
            ),
          ],

        ),
      ),
    );
  }
}
