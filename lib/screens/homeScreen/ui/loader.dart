import 'package:flutter/material.dart';
import 'dart:math';

import 'package:scrap_it/screens/homeScreen/ui/congrats.dart';

class Loader extends StatefulWidget {
  //const Loader({ Key? key }) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;


  final double initialRadius = 90;
  double radius = 0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation_rotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.green,
        title: const Text('Authenticating',
            style: TextStyle(
              fontSize: 26,
            ),
            textAlign: TextAlign.justify),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Center(
              child: Container(
                color: Colors.grey[50],
                width: 200.0,
                height: 200.0,
                child: Center(
                    child: RotationTransition(
                  turns: animation_rotation,
                  child: Stack(
                    children: <Widget>[
                      Dot(
                        radius: 90.0,
                        color: Color.fromARGB(255, 134, 173, 192),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(pi),
                          radius * sin(pi),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(pi / 4),
                          radius * sin(pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(pi / 2),
                          radius * sin(pi / 2),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(3 * pi / 4),
                          radius * sin(3 * pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(5 * pi / 4),
                          radius * sin(5 * pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(6 * pi / 4),
                          radius * sin(6 * pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(7 * pi / 4),
                          radius * sin(7 * pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(8 * pi / 4),
                          radius * sin(8 * pi / 4),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      //pi/8s now for extra dots
                      Transform.translate(
                        offset: Offset(
                          radius * cos(pi),
                          radius * sin(pi),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(pi / 8),
                          radius * sin(pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                          radius * cos(3 * pi / 8),
                          radius * sin(3 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(5 * pi / 8),
                          radius * sin(5 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(7 * pi / 8),
                          radius * sin(7 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(9 * pi / 8),
                          radius * sin(9 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(11 * pi / 8),
                          radius * sin(11 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(13 * pi / 8),
                          radius * sin(13 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
              
                      Transform.translate(
                        offset: Offset(
                          radius * cos(15 * pi / 8),
                          radius * sin(15 * pi / 8),
                        ),
                        child: Dot(
                          radius: 10.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ),
          Flexible(
            flex: 1, 
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(175, 40),
                  textStyle: const TextStyle(fontSize: 16),
                  primary: Colors.green),
              child: const Text('manually verify?'),
              onPressed: () => navigator.push(
                MaterialPageRoute(
                builder: (context) => CongratsPage()
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  //const Dot({ Key? key }) : super(key: key);

  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
