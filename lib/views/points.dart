import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pathsAndConsts.dart';

class PointPage extends StatefulWidget {
  @override
  _PointPage createState() => _PointPage();
}

class _PointPage extends State<PointPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String picture;

  int points;

  void getPoints() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();

    setState(() {
      points = (snap.data() as Map<String, dynamic>)['points'];
      picture = (snap.data() as Map<String, dynamic>)['photoUrl'];
      print(points);
    });
  }

  @override
  void initState() {
    super.initState();

    getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text(
              "Points",
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
          body: Column(
            children: [
              SizedBox(
                height:240,
                child: ListView(
                  children: <Widget>[
                    const Padding(padding:  EdgeInsets.all(11)),
                    const Padding(padding:  EdgeInsets.all(8)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 25, left: 70.0, right: 70.0, bottom: 20),
                      //padding: EdgeInsets.only(top: 30, left: 20.0, right: 20.0, bottom: 20),
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(width: 0.9, color: Colors.green),
                          left: BorderSide(width: 0.9, color: Colors.green),
                          right: BorderSide(width: 0.9, color: Colors.green),
                          bottom: BorderSide(width: 0.9, color: Colors.green),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(11),
                            child: Text(
                              "ScrapIT REWARDS",
                              style: TextStyle(
                                  color: Colors.green[900].withOpacity(1.0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          //Padding(padding: EdgeInsets.all(3)),
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Gold Tier",
                              style: TextStyle(
                                  color: Colors.green.withOpacity(1.0), fontSize: 22),
                            ), //#display the tier here
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 6),
                            child: Text(
                              '$points ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Align(alignment: Alignment.center, child: Text('Sorry you dont have any rewards available as of now :( \nPlease try again later!', textAlign:TextAlign.center,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Inter',
                  fontSize: 24,
                  color: text_body,))),
              ),
            ],
          ),
          
        ));
  }
}