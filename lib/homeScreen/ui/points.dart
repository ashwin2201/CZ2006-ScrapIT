import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DatabaseConnectors/User.dart';




class PointPage extends StatefulWidget {
  @override
  _PointPage createState() => _PointPage();
}
class _PointPage extends State<PointPage> {
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
  User();

  return FutureBuilder(
    future: User().getUserPoints('Ashwin'),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
    {
      if(snapshot.hasData){

        String document = snapshot.data.toString();
        return
        ListView(
    children: <Widget>[
    //Padding(padding: EdgeInsets.all(13)),
    // Container(
    //   child:Image.asset('assets/tempprofile.jpg',
    //   height:150,
    //   width: 150,),
    // ),
    Padding(padding: EdgeInsets.all(11)),
    CircleAvatar(
    backgroundColor: Colors.black,
    radius: 40,
    child: CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/tempprofile.jpg'),
    ),
    ),
    Padding(padding: EdgeInsets.all(8)),
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
    child: Text(document),
    ),
    Container(
    padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 55),
    child:Text("Display Points",
    style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
    ),
    ],
    ),
    ),
    Padding(padding: EdgeInsets.all(5)),
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
      else{
        return ListView(
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(13)),
            // Container(
            //   child:Image.asset('assets/tempprofile.jpg',
            //   height:150,
            //   width: 150,),
            // ),
            Padding(padding: EdgeInsets.all(11)),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 40,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/tempprofile.jpg'),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
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
                    //padding: EdgeInsets.only(top: 6),
                    padding: EdgeInsets.only(left: 85, top: 6),
                    child: Row( children:[ Text("5 /10",
                    textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green[900],fontSize: 35, fontWeight: FontWeight.bold),)],
                  )),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 20),
                    child:Text("",
                      style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(

                border: Border(
                  top: BorderSide(width: 0.9, color:Colors.green),
                  left: BorderSide(width:0.9, color:Colors.green),
                  right: BorderSide(width:0.9, color:Colors.green),
                  bottom: BorderSide(width:0.9, color:Colors.green),


                ),



                color:Colors.green[900],

              ),
              child:Text("REWARDS (10)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 25, fontWeight: FontWeight.bold),),

            ),
            Image.asset('assets/promo.png', height: 300,    width: 300,),


          ],
        );


      }








    },

  );
}