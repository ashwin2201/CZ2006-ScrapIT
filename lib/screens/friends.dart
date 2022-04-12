import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return ListTile(
              contentPadding: EdgeInsets.all(20),
              
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['photoUrl']),
                  radius: 30
                ),
              title: Text(data['name']),
              

            );
          }).toList(),
        );
      },
    );
  }
}