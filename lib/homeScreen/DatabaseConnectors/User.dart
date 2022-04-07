import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final dbRef = FirebaseFirestore.instance;

class User {
  final String? email;
  final double? points;
  final String? uid;
  final String? username;

  List? friends;

  User({
    this.email,
    this.points,
    this.uid,
    this.username
  });

  Future<double> getUserPoints(String username) async {
    log("ASD");
    CollectionReference userCollectionRef = dbRef.collection("users");
    log("ASD");
    QuerySnapshot querySnapshot = await userCollectionRef.where("username", isEqualTo: username).get();


    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    LinkedHashMap<String, dynamic> userDetails = data[0] as LinkedHashMap<String, dynamic>;

    log("${userDetails}");

    return userDetails['points'];

  }

}

