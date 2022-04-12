import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrap_it/Setting/profile.dart';
import 'package:scrap_it/screens/points.dart';

import '../pathsAndConsts.dart';

class SettingsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: userList(context)
    ),
    );
  }

}


Widget userList(BuildContext context) {
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
            leading: Icon(Icons.info),
            title: Text("About"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => About(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.lock),
            title: Text("Password"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => FooLayout(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.notifications),
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
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 65,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('Log Out', style: TextStyle(color: Colors.red)),
                style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)))
              ),
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
        title: Text("About",
          style: TextStyle(
              color: Colors.white
          ),),

        leading: new IconButton(
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
              SizedBox(
                child: Image.asset('assets/download.jpg' ),
                height: 250,
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
              const Text("This is a part of our academic curriculum for the course CZ2006: Software Engineering at NTU, Singapore",
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