import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/pathsAndConsts.dart';

class VerifiedEmail extends StatefulWidget {
  const VerifiedEmail({Key key}) : super(key: key);

  @override
  State<VerifiedEmail> createState() => _VerifiedEmailState();
}

class _VerifiedEmailState extends State<VerifiedEmail> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbardefault,
      body: Column(
        children: [
          SizedBox(height: 200,),
          Align(alignment: Alignment.center, child: Text('Hello, we have sent you an email containing a verified Google link. \n\nPlease check your mail and follow that link to verify your email address to begin using our app. \n\nPlease check your junk/spam folder too!', textAlign:TextAlign.center,style: TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Inter',
            fontSize: 20,
            color: text_body,))),
          _auth.currentUser.emailVerified?Navigator.pushNamed(context, '/screen-0'):
              Container(),
        ],
      )
    );
  }
}
