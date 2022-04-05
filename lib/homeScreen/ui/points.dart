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
      // Container(
      //   child:Image.asset('assets/tempprofile.jpg',
      //   height:150,
      //   width: 150,),
      // ),
      Padding(padding: EdgeInsets.all(10)),
      CircleAvatar(
        backgroundColor: Colors.black,
        radius: 50,
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/tempprofile.jpg'),
        ),
      ),
      Padding(padding: EdgeInsets.all(16)),
      Container(
        margin: EdgeInsets.only(top: 25, left: 70.0, right: 70.0, bottom: 20),
        //padding: EdgeInsets.only(top: 30, left: 20.0, right: 20.0, bottom: 20),
        decoration: BoxDecoration(

        border: Border(
          top: BorderSide(width: 0.9, color:Colors.green),
          left: BorderSide(width:0.9, color:Colors.green),
          right: BorderSide(width:0.9, color:Colors.green),
          bottom: BorderSide(width:0.9, color:Colors.green),

  ),
          borderRadius: BorderRadius.circular(12),


        //color:Colors.black,

        ),


        child: Column(
          children:[
          Container(
            padding: EdgeInsets.only(top: 10),
            child:Text("ScrapIT REWARD",
              style: TextStyle(color: Colors.green.withOpacity(1.0),fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
            //Padding(padding: EdgeInsets.all(3)),
            Container(
              padding: EdgeInsets.only(top: 6),
              child:Text("Gold Tier",
                style: TextStyle(color: Colors.green.withOpacity(1.0),fontSize: 10),),   //#display the tier here
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 55),
              child:Text("Display Points",
                style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
            ),
        ],
      ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        margin: EdgeInsets.only(top: 10,  bottom: 15),
        decoration: BoxDecoration(

          border: Border(
            top: BorderSide(width: 0.9, color:Colors.green),
            left: BorderSide(width:0.9, color:Colors.green),
            right: BorderSide(width:0.9, color:Colors.green),
            bottom: BorderSide(width:0.9, color:Colors.green),


          ),



          color:Colors.green[900],

        ),
        child:Text("REWARDS",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 25, fontWeight: FontWeight.bold),),

      )


    ],
  );
}