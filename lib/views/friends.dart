import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../pathsAndConsts.dart';


class FriendsScreen extends StatefulWidget {
  const FriendsScreen({ Key key }) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();

  
}

class _FriendsScreenState extends State<FriendsScreen> {
  final Stream<QuerySnapshot> _usersStream = 
    FirebaseFirestore.instance.collection('users')
                              .orderBy('points', descending: true)
                              .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Scaffold(
          appBar: appbardefault,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 14, left: 8, right: 8, bottom: 0),
                child:
                const Align(
                  alignment: Alignment.center,
                  child: Text("Global Leaderboard",
                      textAlign: TextAlign.left,
                      style:TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                ),
              ),
              Container(), //CHECK IF WE CAN FIND THE TOP 3 and place them at the podium
              Container(
                child: Center(
                  child: Image.asset(
                    ("assets/trophy.gif"),
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 290,
                child: Flexible(
                  child: ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return Card(
                        margin:  const EdgeInsets.all(10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(data['photoUrl']),
                              radius: 40
                            ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data['name'] , style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'PTSans'), textAlign: TextAlign.left,),
                              Text(data['points'].toString(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20, fontFamily: 'PTSans'), textAlign: TextAlign.right,),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          
        );
      },
    );
  }
}