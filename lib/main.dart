import 'dart:ffi';
import 'package:dcdg/dcdg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/homeScreen/ui/Verification.dart';
import 'package:scrap_it/screens/homeScreen/ui/congrats.dart';
import 'package:scrap_it/screens/homeScreen/ui/loader.dart';
import 'package:scrap_it/screens/homeScreen/ui/recycle.dart';
import 'package:scrap_it/screens/homeScreen/ui/home_screen.dart';
import 'Setting/profile.dart';
import 'screens/homeScreen/ui/points.dart';
import 'package:scrap_it/screens/introduction_screen.dart';
import 'package:scrap_it/screens/login_screen.dart';
import 'package:scrap_it/screens/signup_screen.dart';
import 'package:scrap_it/screens/test_screen.dart';
import 'package:scrap_it/screens/launch_screen.dart';
import 'Setting/setting.dart';
import '../screens/launch_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //         apiKey: "AIzaSyDd_MhbqxXNN7zFEc40Gv6rkG39W_j5YCk",
  //         appId: "1:760315372038:android:8eeb9558c591090c161987",
  //         messagingSenderId: "760315372038",
  //         projectId: "scrap-it-f667e",
  //         storageBucket: 'scrap-it-f667e.appspot.com'
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: "AIzaSyDd_MhbqxXNN7zFEc40Gv6rkG39W_j5YCk",
    //     appId: "1:760315372038:android:8eeb9558c591090c161987",
    //     messagingSenderId: "760315372038",
    //     projectId: "scrap-it-f667e",
    //     storageBucket: 'scrap-it-f667e.appspot.com'

  );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => LaunchScreen(),
        //'/': (context) => Screen0(),
        '/screen-0': (context) => Screen0(),
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
