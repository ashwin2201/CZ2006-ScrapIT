import 'package:flutter/material.dart';
import 'package:scrap_it/screens/friends.dart';
import '../Setting/setting.dart';
import './homeScreen/ui/home_screen.dart';
import 'homeScreen/ui/recycle.dart';

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
 // final _page4 = GlobalKey<NavigatorState>();
 // TabItem currentTab = TabItem.red;

 // void _selectTab(TabItem tabItem) {
  //  setState(() {
  //    currentTab = tabItem;
  //  });
  //}
  /* int _selectedIndex = 0; //New

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index==1) {
        Navigator.pushNamed(context, "/recycle");
      }
      else if(index==2){
        Navigator.pushNamed(context, "/settings");
      }
      else{
        Navigator.pushNamed(context, "/home");
      }
    }
    );
  }

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];
*/
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
       /* appBar: AppBar(title:Text("Test Pages"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,),*/
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
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Friends'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Recycle'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
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
      ),    //helo
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


