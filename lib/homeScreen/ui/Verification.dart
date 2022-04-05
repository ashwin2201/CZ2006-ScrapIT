import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/homeScreen/ui/home_screen.dart';
import 'dart:math';

class VerificationPage extends StatelessWidget {
  //const CongratsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Photo Verification"),
            centerTitle: true,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          body: verificationPage(context)),
    );
  }
}

Widget verificationPage(BuildContext context) {
  return ListView(
    children: <Widget>[
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Please submit      visual evidence',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Colors.black,
            ),
          ),
        ),
      ),
      const Expanded(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.green,
          child: Image(
            image: AssetImage('Images/camera_icon.png'),
            alignment: Alignment.bottomRight,
          ),
        ),
      ),
      Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(225, 50),
                textStyle: const TextStyle(fontSize: 22),
                primary: Colors.green),
            child: const Text('Upload Image'),
            onPressed: () => Navigator.pop(context),






          )),


          
      SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Submit a photo of all the items together which you recycled. One of our admins will verify the photo from their ' +
                'end and post successful verification, points will be rewarded!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontFamily: 'PTSans',
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
