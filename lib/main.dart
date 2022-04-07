import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/ui/Verification.dart';
import 'package:scrap_it/screens/homeScreen/ui/congrats.dart';
import 'package:scrap_it/screens/homeScreen/ui/loader.dart';
import 'package:scrap_it/screens/homeScreen/ui/recycle.dart';
import 'package:scrap_it/screens/homeScreen/ui/home_screen.dart';
import 'package:scrap_it/screens/test_screen.dart';
import 'screens/homeScreen/ui/points.dart';
import 'package:scrap_it/screens/introduction_screen.dart';
import 'package:scrap_it/screens/login_screen.dart';
import 'package:scrap_it/screens/signup_screen.dart';
import 'package:scrap_it/screens/test_screen.dart';
import 'package:scrap_it/screens/launch_screen.dart';
import 'Setting/setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => LaunchScreen(),
        '/screen-0': (context) => Screen0(),
        '/introduction': (context) => IntroductionScreen(),
        '/sign-up': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => TestHomeScreen(),
        '/settings': (context) => SettingsLayout(),
        '/points': (context) => PointPage(),
        '/congrats': (context) => CongratsPage(),
        '/verification': (context) => VerificationPage(),
        '/recycle':(context) => RecyclePage()
      }
    );
  }
}
