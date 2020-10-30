import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:i_space/Data/ImageData.dart';
import 'package:i_space/Widget/AppBar.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final _auth = FirebaseAuth.instance;


class InstagramSearchGrid extends StatefulWidget {
  const InstagramSearchGrid({Key key}) : super(key: key);

  @override
  _InstagramSearchGridState createState() => _InstagramSearchGridState();
}

class _InstagramSearchGridState extends State<InstagramSearchGrid> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    databaseReference.child(userId).child("Image").orderByKey().once().then((DataSnapshot snapshot)
    {
      if (snapshot.value != null)
      {
        print(snapshot);
        var data = snapshot.value;
        lists.clear();
        data.forEach((key, value){
          lists.add(value["link"]);
        });
        setState(() {
          print("value is ${lists.length}");
          print(lists);

        });
      }
      else{
        print("this ID hs no Data !!");
      }

    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: lists.length,
          itemBuilder: (context, index) => Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.network(lists[index].toString(), fit: BoxFit.cover,)),
          ),
          staggeredTileBuilder: (index) => StaggeredTile.count(
              (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: imageList.length,
        itemBuilder: (context, index) => ImageCard(
          imageData: imageList[index],
        ),
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}


class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}


