import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrap_it/views/profile.dart';
import 'package:scrap_it/views/points.dart';
import '../pathsAndConsts.dart';
import 'launch_screen.dart';

class SettingsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appbardefault,
        body: userList(context)
    ),
    );
  }
}


Widget userList(BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await auth.signOut();
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LaunchScreen();
        },
      ),
          (_) => false,
    );;
  }

  return Container(
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(13)),
        Container(
          padding: EdgeInsets.all(8.0),
          child:
          Align(
            alignment: Alignment.center,
            child: Text("Settings",
                textAlign: TextAlign.left,
                style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
        Padding(padding: EdgeInsets.all(7)),
        Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => Profile(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          ),
        ),

        Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.redeem),
            title: Text("Points"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => PointPage(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          ),
        ),
        SizedBox(height:120),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => About(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
            child: Container(
                child: ElevatedButton(
                  child: Text(
                      "Click here to learn more about us!",
                      style: TextStyle(
                        decorationColor: Colors.green,
                          fontWeight: FontWeight.normal, color: Colors.green,fontSize:18, decoration: TextDecoration.underline,
                
                      )
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                )
            ),
          ),
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: _signOut,
              child: Text('Log Out', style: TextStyle(color: Colors.red)),
              style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)))
            ),
          ),
        ],
      )
      ],
    ),
  );
}




class FooLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Title"),
          leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text("Not Coded Yet"),
        ),
      ),
    );
  }
}


class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}
class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("About us",
          style: TextStyle(
              color: Colors.white
          ),),

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 14),
                child: SizedBox(
                  child: Image.asset('assets/Scrapit_logo.png' ),
                  height: 250,
                ),
              ),
              const Text("As Singapore progresses into a more technologically advanced country, where online shopping and electronics usage becomes more prevalent. as a result, massive amount of recyclables such as E-waste and cardboards are being produced daily. This application is developed with the aim to aid and encourage our citizens into adopting a more eco friendly approach while dealing with their recyclable waste.",
                style: TextStyle(
                    fontSize: 18.00,
                    color: Colors.black
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text("This is a part of our academic curriculum for the course CZ2006: Software Engineering at Nanyang Technological University in Singapore",
                style: TextStyle(
                    fontSize: 18.00,
                    color: Colors.black
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}