import 'package:flutter/material.dart';

import '../pathsAndConsts.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 1),
              Align(alignment: Alignment.center, child: Text('Welcome to ScrapIT!', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                fontSize: 28,
                color: text_body,))),
              const SizedBox(height: 50),
              Align(alignment: Alignment.center, child: Text('Who would have thought recycling could be fun?', textAlign:TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                fontSize: 28,
                color: text_body,))),
              const SizedBox(height: 50),
              Flexible(child: Container(), flex: 0),
              Image.asset(
                ("assets/Scrapit_logo.png"),
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 24
              ),
              // Text field inputs
               InkWell(
                onTap: () => Navigator.pushNamed(context, '/introduction'),
                child: Container(
                  child: const Text(
                    "Let's get started!", 
                    style: TextStyle(color: Colors.white),
                  ),
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
              Flexible(child: Container(), flex: 2),
            ],
          )
        ),
      ),
    );
  }
}