import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              const SizedBox(height: 64),
              const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/images/trashcan.png')
              ),
              const SizedBox(
                height: 24
              ),
              // Text field inputs
              InkWell(
              onTap: () => Navigator.pushNamed(context, '/sign-up'),
              child: Container(
                child: const Text("Sign up", 
                    style: TextStyle(color: Colors.white),),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  color: Color(0xFF2F7833)
                ),
            )
              ),
              const SizedBox(
                height: 24
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: Container(
                  child: const Text("Log in", 
                    style: TextStyle(color: Colors.white),),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    color: Color(0xFF2F7833)
                  ),
              )
              ),
              const SizedBox(
                height: 24
              ),
              /*InkWell(
              onTap: () => Navigator.pushNamed(context, '/screen-0'),
              child: Container(
                child: const Text("Screen 0", 
                    style: TextStyle(color: Colors.white),),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  color: Color(0xFF2F7833)
                ),
              )
              ),*/
              Flexible(child: Container(), flex: 3),
            ],
          )
        ),
      ),
      );
  }
}