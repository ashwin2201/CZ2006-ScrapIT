import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title:Text("Points"),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,),
          body: pointPage(context)
      ),

      //bottomNavigationBar: build2(context),


    );
  }

}

Widget pointPage(BuildContext context) {
  return ListView(
    children: <Widget>[
      //Padding(padding: EdgeInsets.all(13)),
      Container(
        child:Image.asset('assets/tempprofile.jpg',
        height:150,
        width: 150,),
      ),
      //Padding(padding: EdgeInsets.all(7)),
      Container(
        margin: EdgeInsets.only(top: 20, left: 70.0, right: 70.0, bottom: 20),
        padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0, bottom: 20),
        decoration: BoxDecoration(

        border: Border(
          top: BorderSide(width: 1.0),
          left: BorderSide(width:1.0),
          right: BorderSide(width:1.0),
          bottom: BorderSide(width:1.0),
  ),
          borderRadius: BorderRadius.circular(13),
        //color:Colors.black,

        ),


        child: Column(
          children:[
          Container(
            child:Text("ScrapIT REWARD"),
          ),
            //Padding(padding: EdgeInsets.all(3)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child:Text("Display Tier",
                style: TextStyle(color: Colors.green.withOpacity(1.0)),),   //#display the tier here
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child:Text("Display Points",
                style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
            ),
        ],
      ),
      ),
      Container(
        padding: EdgeInsets.only(top: 15, bottom: 20),
        child:Text("Rewards",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87.withOpacity(1.0),fontSize: 25),),

      )


    ],
  );
}