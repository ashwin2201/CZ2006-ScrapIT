import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class About extends StatelessWidget {


  // static const String id = 'welcome_screen'

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
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/about2.jpg'),
                height: 350,

              ),
              SizedBox(
                height: 0.0,
              ),
              Text(
                "As Singapore progresses into a more technologically advanced country, where online shopping and electronics usage becomes more prevalent. as a result, massive amount of recyclables such as E-waste and cardboards are being produced daily. This application is developed with the aim to aid and encourage our citizens into adopting a more eco friendly approach while dealing with their recyclable waste.",
                style: TextStyle(
                    fontSize: 5.00,
                    color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "This is a part of our academic curriculum for the course CZ2006: Software Engineering at NTU, Singapore",
                style: TextStyle(
                    fontSize: 5.00,
                    color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}