import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              pageBuilder: (_, __, ___) => FooLayout(),
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
              pageBuilder: (_, __, ___) => FooLayout(),
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
        title: Text("Notifications"),
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