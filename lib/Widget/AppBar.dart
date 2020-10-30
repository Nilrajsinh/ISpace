
import 'dart:math';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final _auth = FirebaseAuth.instance;

String PhotoURL;
String userId;
String imgUrl;
String userNickName;
String userEmail;
File _imageFile;
final picker = ImagePicker();
String _uploadUrl;
List<String> lists = List();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  String Createrandom([int length = 32]){
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (index) => _random.nextInt(256));
    return base64Url.encode(values);

  }

  // Future pickImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   setState(() async {
  //     _imageFile = File(pickedFile.path);
  //     String fileName = basename(_imageFile.path);
  //     StorageReference firebaseStorageRef =
  //     FirebaseStorage.instance.ref().child('Images/$fileName');
  //     StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  //     StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //     taskSnapshot.ref.getDownloadURL().then(
  //           (value) => print("Done: $value"),
  //     );
  //
  //     firebaseStorageRef.getDownloadURL().then((value) {
  //       _uploadUrl = value;
  //
  //       if(_uploadUrl != null)
  //       {
  //         dynamic key = Createrandom(32);
  //         databaseReference.child(userId).child("Image").set({
  //           // "id": key,
  //           "link" : _uploadUrl
  //         }).then((value){
  //           print("upload image is done");
  //         });
  //       }
  //       else{
  //         print("url is null !!");
  //       }
  //     });
  //   });
  // }

  Future <void> getCurrentUser() async
  {
    final user = await _auth.currentUser;
    print(user);
    final uid = user.uid;
    userId = uid;
    print('User ID:  '+userId);
    print('User email: '+user.email);
    print('User photo: '+user.photoUrl.toString());
    userEmail = user.email.toString();
    PhotoURL = user.photoUrl.toString();
  }

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
          IconButton(icon: Icon(Icons.add), onPressed: () async{


            final user = await _auth.currentUser;
            print(user);
            final uid = user.uid;
            userId = uid;


            final pickedFile = await picker.getImage(source: ImageSource.gallery);

            _imageFile = File(pickedFile.path);
            String fileName = basename(_imageFile.path);
            StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('Images/$fileName');
            StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
            StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
            taskSnapshot.ref.getDownloadURL().then(
                  (value) => print("Done: $value"),
            );

            firebaseStorageRef.getDownloadURL().then((value) {
              _uploadUrl = value;

              if(_uploadUrl != null)
              {
                dynamic key = Createrandom(32);
                databaseReference.child(userId).child("Image").push().set({
                  // "id": key,
                  "link" : _uploadUrl
                }).then((value){
                  print("upload image is done");
                });
              }
              else{
                print("url is null !!");
              }
            });




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

