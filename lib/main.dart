import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/screens/login_screen.dart';
import 'package:scrap_it/screens/test_screen.dart';
import 'Setting/setting.dart';
import './screens/homeScreen/ui/home_screen.dart';

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
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsLayout(),
      }
    );
  }
}
