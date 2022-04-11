import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/ui/home_screen.dart';
import 'package:scrap_it/screens/homeScreen/ui/recycle.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrap_it/resources/auth_methods.dart';
import 'package:scrap_it/screens/test_screen.dart';
import 'package:scrap_it/screens/homeScreen/DatabaseConnectors/User.dart';

class CongratsPage extends StatefulWidget {
  //const CongratsPage({ Key? key }) : super(key: key);

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  int points;
  int points2;
  int flag;
  int temp;
  String uid;

  @override
  void initState() {
    super.initState();

    flag = 0;
    temp = 0;
    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Points"),
            centerTitle: true,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          body: congratsPage(context)),
    );
  }

  Widget congratsPage(BuildContext context) {
    final navigator = Navigator.of(context);

    temp = pointGenerator(flag, temp);

    points = points2 + temp;

    flag++;
    updatePoints(uid, points);

    return ListView(
      children: <Widget>[
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: Text(
              'Congratulations! You have earned ' +
                  temp.toString() +
                  ' points! ', //need to make this only randomize points once per succesful verifcation
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 39, 131, 42),
              ),
            ),
          ),
        ),
        SafeArea(
          child: SizedBox(
              //margin: const EdgeInsets.only(top: 20),
              //padding: const EdgeInsets.all(20),
              height: 200,
              width: 200,
              child: Image.asset('assets/images/E-waste-Disposal.png')),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Thank you for using ScrapIT to recycle your E-Waste! Your points will be reflected in your accounts tab shortly. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          //margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 45),
                textStyle: const TextStyle(fontSize: 26),
                primary: Colors.green),
            child: const Text('Recycle More'),
            onPressed: () => navigator.push(
              MaterialPageRoute(builder: (context) => RecyclePage()),
            ), //Navigator
          ),
        ),
      ],
    );
  }

  updatePoints(String id, int points) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'points': points});
  }

  // void updatePoints() async {
  //   // final User user = await auth.currentUser;
  //   //uid = user.uid;
  //   DocumentSnapshot snap = (await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .update({'points': points})) as DocumentSnapshot<Object>;
  //   setState(() {
  //     points = (snap.data() as Map<String, dynamic>)['points'];
  //   });
  // }

  int pointGenerator(flag, int points) {
    int check = flag;
    int p = points;
    if (check >= 1) {
      return p;
    } else if (check == 0) {
      Random random = Random();
      int num = random.nextInt(1000) + 400; //from 400 to 1000 points alloted
      p = num;
      return p;
    }
  }

  void getPoints() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();

    setState(() {
      points = (snap.data() as Map<String, dynamic>)['points'];
      points2 = (snap.data() as Map<String, dynamic>)['points'];
      uid = (snap.data() as Map<String, dynamic>)['uid'];
      //print(points);
    });
  }
}
