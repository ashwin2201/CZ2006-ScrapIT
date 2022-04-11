import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/ui/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrap_it/screens/homeScreen/ui/congrats.dart';
import 'package:scrap_it/screens/homeScreen/ui/loader.dart';
import 'package:scrap_it/screens/test_screen.dart';

class VerificationPage extends StatefulWidget {
  //const VerificationPage({Key key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  File imageFile;

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

  Widget verificationPage(BuildContext context) {
    return ListView(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Please submit visual evidence',
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
              image: AssetImage('assets/images/camera_icon.png'),
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
            onPressed: () => cameraPopup(context),
          ),
        ),
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

  ////////////////////////////////////////////////////////////////////////////////
  cameraPopup(BuildContext context) {
    //hardcoding state need to make this all stateful later
    int state1 = 0;

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            height: 190,
            width: 200,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                const Text(
                  'Select one of the options below',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Spacer(flex: 1),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(225, 50),
                        textStyle: const TextStyle(fontSize: 22),
                        backgroundColor: Colors.green,
                        primary: Colors.black),
                    child: const Text(
                      'Take Picture from Camera',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      getFromCamera();
                    }),
                const Spacer(flex: 3),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(225, 50),
                        textStyle: const TextStyle(fontSize: 22),
                        backgroundColor: Colors.green,
                        primary: Colors.black),
                    child: const Text(
                      'Select from Gallery',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      getFromGallery(context);
                    }),
              ],
            ),
          ));
        });
  }

  getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  getFromGallery(BuildContext context) async {
    final navigator = Navigator.of(context);
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await navigator.push(
        MaterialPageRoute(
          builder: (context) => 
          Loader()
        )
      );
    }
  }

  
}
