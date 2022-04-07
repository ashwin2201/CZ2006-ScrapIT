import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/test_screen.dart';
import 'homeScreen/ui/points.dart';
import 'Setting/setting.dart';
import 'homeScreen/ui/home_screen.dart';
//import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MyApp());
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform;
//   );
//   runApp(MyApp());
// }

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

      }
    );
  }
}
