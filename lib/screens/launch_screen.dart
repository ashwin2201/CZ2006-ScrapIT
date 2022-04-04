import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({ Key? key }) : super(key: key);

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
              Flexible(child: Container(), flex: 2),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/images/trashcan.png')
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