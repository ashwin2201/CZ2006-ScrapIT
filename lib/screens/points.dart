import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/DatabaseConnectors/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PointPage extends StatefulWidget {
  @override
  _PointPage createState() => _PointPage();
}
class _PointPage extends State<PointPage> {
  //final FirebaseAuth auth = FirebaseAuth.instance;
  int points;
  void getPoints()  async {
    // final User user = await auth.currentUser;
    //uid = user.uid;
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid).get();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid).get();

    setState((){
     // name= (snap.data() as Map<String, dynamic>)['name'];
      points= (snap.data() as Map<String, dynamic>)['points'];

      //print(name);
      print(points);
    });
    //var firebaseUser = await FirebaseFirestore.instance.user.uid
    //       .collection('users')
    //       .doc(user.uid);
    //  email12 =user.email;
    //print(email12);
  }
  @override
  void initState() {
    super.initState();

    getPoints();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "Points",
              style: TextStyle(color: Colors.black),
            ),
            leading: new IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
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
          style: TextStyle(color: Colors.green[900].withOpacity(1.0),fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
      //Padding(padding: EdgeInsets.all(3)),
      Container(
        padding: EdgeInsets.only(top: 6),
        child:Text("Gold Tier",
          style: TextStyle(color: Colors.green.withOpacity(1.0),fontSize: 10),),   //#display the tier here
      ),
      Container(
        padding: EdgeInsets.only(left: 10, top: 6),
        child: Text('$points ',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green[900],fontSize: 35, fontWeight: FontWeight.bold),
      ),),
    /*
    Container(
    child: IconButton(
    onPressed: () {

    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => PointPage()), // this PointPage is your page to refresh
    (Route<dynamic> route) => false,
    );
    },

    icon: const Icon(Icons.refresh, size: 35,),
    ),),
  */
    // Container(
    // padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 55),
    // child:Text("Display Points",
    // style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
    // ),
    ],
    ), //pointPage(context)

      ),],
          ),

      //bottomNavigationBar: build2(context),


    )
    );
  }



}
/*
Widget pointPage(BuildContext context) {
  // User();

  return FutureBuilder(
    //future: User().getUserPoints('nipunbhatia06@gmail.com'),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
    {
      if(snapshot.hasData){
        // snapshot.data

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
                        style: TextStyle(color: Colors.green[900].withOpacity(1.0),fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.all(3)),
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      child:Text("Gold Tier",
                        style: TextStyle(color: Colors.green.withOpacity(1.0),fontSize: 10),),   //#display the tier here
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 6),
                      child: Text(points +" /1000",)
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green[900],fontSize: 35, fontWeight: FontWeight.bold),
                      ),),
                    Container(
                      child: IconButton(
                        onPressed: () {

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => PointPage()), // this PointPage is your page to refresh
                                (Route<dynamic> route) => false,
                          );
                        },

                        icon: const Icon(Icons.refresh, size: 35,),
                      ),),

                    // Container(
                    // padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 55),
                    // child:Text("Display Points",
                    // style: TextStyle(color: Colors.black87.withOpacity(1.0)),),   //#display the tier here
                    // ),
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

              ),
              Image.asset('assets/noAva.jpg', height: 300,    width: 300,),


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
                      style: TextStyle(color: Colors.green[900].withOpacity(1.0),fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  //Padding(padding: EdgeInsets.all(3)),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child:Text("Loading tier",
                      style: TextStyle(color: Colors.green.withOpacity(1.0),fontSize: 10),),   //#display the tier here
                  ),
                  Container(
                    //padding: EdgeInsets.only(top: 6),
                      padding: EdgeInsets.only(left: 85, top: 15),
                      child: Row( children:[ Text("Loading...",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green[900],fontSize: 15, fontWeight: FontWeight.bold),)],
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
              child:Text("REWARDS ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(1.0),fontSize: 25, fontWeight: FontWeight.bold),),

            ),
            ////Image.asset('assets/promo.png', height: 300,    width: 300,),
            Image.asset('assets/noAva.jpg', height: 300,    width: 300,),


          ],
        );


      }








    },

  );
}

 */
