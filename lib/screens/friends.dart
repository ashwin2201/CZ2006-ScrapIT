import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pathsAndConsts.dart';


class FriendsScreen extends StatefulWidget {
  const FriendsScreen({ Key key }) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();

  
}

class _FriendsScreenState extends State<FriendsScreen> {
  final Stream<QuerySnapshot> _usersStream = 
    FirebaseFirestore.instance.collection('users')
                              .orderBy('points', descending: true)
                              .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "ScrapIT",
              style: TextStyle(
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 34,
                color: text_heading,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            backgroundColor: appbar_green,
            toolbarHeight: 65,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child:
                const Align(
                  alignment: Alignment.center,
                  child: Text("Global Leaderboard",
                      textAlign: TextAlign.left,
                      style:TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 490,
                child: Flexible(
                  child: ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return Card(
                        margin:  const EdgeInsets.all(10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(data['photoUrl']),
                              radius: 40
                            ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data['name'] , style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20), textAlign: TextAlign.left,),
                              Text(data['points'].toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20), textAlign: TextAlign.right,),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          
        );
      },
    );
  }
}