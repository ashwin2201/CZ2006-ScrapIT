import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/views/Verification.dart';
import 'package:scrap_it/views/congrats.dart';
import 'package:scrap_it/views/recycle.dart';
import 'package:scrap_it/views/home_screen.dart';
import 'package:scrap_it/views/verifyfirst.dart';
import 'views/profile.dart';
import 'views/points.dart';
import 'package:scrap_it/views/introduction_screen.dart';
import 'package:scrap_it/views/login_screen.dart';
import 'package:scrap_it/views/signup_screen.dart';
import 'package:scrap_it/views/test_screen.dart';
import 'package:scrap_it/views/launch_screen.dart';
import 'views/setting.dart';
import 'views/launch_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LaunchScreen(),
       '/screen-0': (context) => Screen0(),
        '/verify': (context) => VerifyEmail(),
        '/introduction': (context) => IntroductionScreen(),
        '/sign-up': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => TestHomeScreen(),
        '/settings': (context) => SettingsLayout(),
        '/points': (context) => PointPage(),
        '/congrats': (context) => CongratsPage(),
        '/verification': (context) => VerificationPage(),
        '/recycle':(context) => RecyclePage(),
        '/About':(context) => About(),
        '/profile':(context) => Profile()
      }
    );
  }
}
