import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Profile extends StatefulWidget {


  // static const String id = 'welcome_screen';
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String email12 ='';
  String name;
  int points;
  String picture;

  @override
  void initState() {
    super.initState();
    getUser();
    getUsername();
  }


   void getUser()  async {
     final User user = await auth.currentUser;
      setState((){
       email12 =user.email;
       print(user.photoURL);
      });
  }
  void getUsername()  async {
   // final User user = await auth.currentUser;
    //uid = user.uid;
    DocumentSnapshot snap = await FirebaseFirestore.instance
    .collection('users')
    .doc(auth.currentUser.uid).get();
    FirebaseFirestore.instance
    .collection('users')
    .doc(auth.currentUser.uid).get();

    setState((){
      Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
      name = data['name'];
      points = data['points'];
      picture = data['photoUrl'];
      print(name);
      print(points);
      print(picture);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Container(height: 50, width: 100),
            Container(
                child: CircleAvatar(backgroundImage: NetworkImage('$picture'), radius: 50)),
            SizedBox(height: 50.0,),
            Container(
              alignment: Alignment.topLeft,
              child: Text('Personal information', style: TextStyle(fontSize: 18.00, color: Colors.grey), textAlign: TextAlign.center,),
            ),
            SizedBox(height: 30.0,),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Name : ", style: TextStyle(fontSize: 13.00, color: Colors.grey), textAlign: TextAlign.left,),
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.all(6.9),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("$name", style: TextStyle(fontSize: 16.00, color: Colors.black)),
            ),
            SizedBox(height: 40.0,),
            Container(
              alignment: Alignment.topLeft,
              child: Text("E-mail : ", style: TextStyle(fontSize: 13.00, color: Colors.grey), textAlign: TextAlign.left,),
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.all(6.9),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("$email12", style: TextStyle(fontSize: 16.00, color: Colors.black),),
            ),
          ],
        ),
      ),

    );
  }
}