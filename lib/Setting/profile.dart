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
  // final _firestore = Firestore.instance;
  //FirebaseUser loggedInUser;
 // String email12 ='';
   //String email12 ='';
  @override
  void initState() {
    super.initState();

    getUser();
    getUsername();
  }

 // var currentUserLoginUser = FirebaseAuth.instance.currentUser;
//  String xyz= currentUserLoginUser.email;

   void getUser()  async {
     final User user = await auth.currentUser;
    //uid = user.uid;
  //  var firebaseUser = await FirebaseFirestore.instance
   //     .collection('users')
    //    .doc(currentUserLoginUser.uid);
      //email12 =user.email;
      setState((){
       email12 =user.email;
       print(user.photoURL);
      });
    //print(email12);
  }
  void getUsername()  async {
   // final User user = await auth.currentUser;
    //uid = user.uid;
    DocumentSnapshot snap = await FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser.uid).get();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid).get();

    setState((){
      name= (snap.data() as Map<String, dynamic>)['name'];
      points= (snap.data() as Map<String, dynamic>)['points'];

      print(name);
      print(points);
    });
    //var firebaseUser = await FirebaseFirestore.instance.user.uid
  //       .collection('users')
  //       .doc(user.uid);
  //  email12 =user.email;
    //print(email12);
  }

 // Future<String> getEmail() async{
   // User user = await auth.currentUser;
    //return user.email;
  //}
  //void getData(){
  //  final data=_firestore.collection('users').getDocuments();

  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "PROFILE",
          style: TextStyle(color: Colors.black),
        ),
        leading: new IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
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
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://simg.nicepng.com/png/small/136-1366211_group-of-10-guys-login-user-icon-png.png'),
                    radius: 80)),
            SizedBox(
              height: 50.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'PERSONAL INFORMATION',
                style: TextStyle(fontSize: 15.00, color: Colors.grey),
                textAlign: TextAlign.center,

                // textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Name:",
                style: TextStyle(fontSize: 20.00, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "$name",
                style: TextStyle(fontSize: 20.00, color: Colors.black),
                textAlign: TextAlign.left,
              ),

            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "E-mail:",
                style: TextStyle(fontSize: 20.00, color: Colors.black),
                textAlign: TextAlign.left,
              ),

            ),
          Container(
          alignment: Alignment.topLeft,
          child: Text(
            '$email12',
            style: TextStyle(fontSize: 20.00, color: Colors.black),
            textAlign: TextAlign.left,
          ),
          )
          ],
        ),
      ),
    );
  }
}