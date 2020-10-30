import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

final fb = FirebaseDatabase.instance.reference().child("LikeImage");

String Createrandom([int length = 32]){
  final Random _random = Random.secure();
  var values = List<int>.generate(length, (index) => _random.nextInt(256));
  return base64Url.encode(values);

}



class _ImageViewState extends State<ImageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Column(
              children: [
                Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Image.network(widget.imgUrl)),
              ],
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                      )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                    ),

                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}