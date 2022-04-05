import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/homeScreen/ui/home_screen.dart';
import 'dart:math';

class CongratsPage extends StatelessWidget {
  //const CongratsPage({ Key? key }) : super(key: key);

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
}

Widget congratsPage(BuildContext context) {
  return ListView(
    children: <Widget>[
      SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          child:  Text(
            'Congratulations! You have earned ' + pointGenerator() + ' points! ', //need to make this only randomize points once per succesful verifcation
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
            child: Image.asset('Images/E-waste-Disposal.png')),
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
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(140, 50),
                textStyle: const TextStyle(fontSize: 26),
                primary: Colors.green),
            child: const Text('Go back'),
            onPressed: () => Navigator.pop(context),
          ))
    ],
  );
}

String pointGenerator() {
  Random random = Random();
  int num = random.nextInt(1000) + 400; //from 400 to 1000 points alloted
  String points = num.toString();
  return points;
}
