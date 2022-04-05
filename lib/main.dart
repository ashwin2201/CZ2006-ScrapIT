import 'package:flutter/material.dart';
import 'package:scrap_it/homeScreen/ui/congrats.dart';
import 'package:scrap_it/test_screen.dart';
import 'homeScreen/ui/points.dart';
import 'Setting/setting.dart';
import 'homeScreen/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => Screen0(),
        '/settings': (context) => SettingsLayout(),
        '/home': (context) => HomePage(),
        '/points': (context) => PointPage(),
        '/congrats': (context) => CongratsPage()

      }
    );
  }
}
