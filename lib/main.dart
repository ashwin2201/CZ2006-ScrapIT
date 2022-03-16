import 'package:flutter/material.dart';
import 'package:scrap_it/test_screen.dart';

import 'homeScreen/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {'/': (context) => Screen0(), '/home': (context) => HomePage()},
    );
  }
}
