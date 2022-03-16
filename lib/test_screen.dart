import 'package:flutter/material.dart';
import 'homeScreen/ui/home_screen.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title:Text("Test Pages"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,),
        body: TestList(context),
        //bottomNavigationBar: build2(context),
      ),

    );
  }

}

Widget TestList(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.newspaper),
        title: Text("News"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/home");
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/settings");
        },
      ),

    ],
  );
}
