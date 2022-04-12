import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/DatabaseConnectors/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FriendsScreen extends StatefulWidget {
  const FriendsScreen({ Key key }) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('friends')

    );
  }
}