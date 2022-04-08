import 'dart:collection';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


final dbRef = FirebaseFirestore.instance;

class User {
  final String email;
  final double points;
  final String uid;
  final String username;

  List friends;

  User({
    this.email,
    this.points,
    this.uid,
    this.username
  });

  // Future<void> getUserPoints(String username) async {
  //   log("ASD");
  //   CollectionReference userCollectionRef = dbRef.collection("users");
  //   log("ASD1");
  //   QuerySnapshot querySnapshot = await userCollectionRef.where("name", isEqualTo: username).get();
  //   log("ASD2");
  //
  //
  //   final data = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   LinkedHashMap<String, dynamic> userDetails = data[0] as LinkedHashMap<String, dynamic>;
  //   log("ASD3");
  //   log("${userDetails}");
  //
  //   return userDetails['points'];
  //
  // }
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('users');


  Future<void> getUserPoints(String email) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.where("email", isEqualTo: email).get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //allData as String;
    LinkedHashMap<String, dynamic> userDetails = allData[0] as LinkedHashMap<String, dynamic>;

    return userDetails;
  }
}

