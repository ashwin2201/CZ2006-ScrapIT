import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/Setting/profile.dart';
import 'package:scrap_it/screens/homeScreen/ui/recycle.dart';
import 'package:scrap_it/screens/points.dart';
//import 'package:flutter/profile.dart';
class SettingsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title:Text("Settings"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,),
        body: userList(context)
    ),

        //bottomNavigationBar: build2(context),


    );
  }

}



Widget userList(BuildContext context) {
  return ListView(
    children: <Widget>[
      Padding(padding: EdgeInsets.all(13)),
      Container(
        child:
        Text("Account",
            textAlign: TextAlign.left,
            style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      Padding(padding: EdgeInsets.all(7)),
      ListTile(
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
      ListTile(
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
      ListTile(
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
      ListTile(
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

    ],
  );
}


// Widget build2(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text("log out"),
//       ),
//     ),
//   );
// }

class FooLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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


  // static const String id = 'welcome_screen';
  @override
  _AboutState createState() => _AboutState();
}
class _AboutState extends State<About> {
  //get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("About",
          style: TextStyle(
              color: Colors.black
          ),),

        leading: new IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('images/about2.jpg' ),
              height: 350,

            ),
            SizedBox(
              height: 0.0,
            ),
            Text("As Singapore progresses into a more technologically advanced country, where online shopping and electronics usage becomes more prevalent. as a result, massive amount of recyclables such as E-waste and cardboards are being produced daily. This application is developed with the aim to aid and encourage our citizens into adopting a more eco friendly approach while dealing with their recyclable waste.",
              style: TextStyle(
                  fontSize: 20.00,
                  color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("This is a part of our academic curriculum for the course CZ2006: Software Engineering at NTU, Singapore",
              style: TextStyle(
                  fontSize: 20.00,
                  color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}