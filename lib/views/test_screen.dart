import 'package:flutter/material.dart';
import 'package:scrap_it/views/friends.dart';
import 'setting.dart';
import 'home_screen.dart';
import 'recycle.dart';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  int _currentIndex = 0;

  final _home = GlobalKey<NavigatorState>();
  final _friends = GlobalKey<NavigatorState>();
  final _recycle = GlobalKey<NavigatorState>();
  final _settings = GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            Navigator(
              key: _home,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => TestHomeScreen(),
              ),
            ),
            Navigator(
              key: _friends,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => FriendsScreen(),
              ),
            ),
            Navigator(
              key: _recycle,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => RecyclePage(),
              ),
            ),
            Navigator(
              key: _settings,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => SettingsLayout(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_rounded),
                  label: 'Leaderboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.recycling), label: 'Recycle'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              //  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget TestList(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.newspaper),
        title: Text("News"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/home");
        },
      ), //helo
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/settings");
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Points"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/points");
        },
      ),
      ListTile(
        leading: Icon(Icons.reviews),
        title: Text("Congrats"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/congrats");
        },
      ),
      ListTile(
        leading: Icon(Icons.verified),
        title: Text("Verification"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/verification");
        },
      ),
      ListTile(
        leading: Icon(Icons.recycling),
        title: Text("Recycling"),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          Navigator.pushNamed(context, "/recycle");
        },
      ),
    ],
  );
}
