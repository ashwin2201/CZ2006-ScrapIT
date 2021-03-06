import '../models/api/news_api_service.dart';
import 'package:flutter/material.dart';
import 'widgets/customListTile.dart';
import '../models/article_model.dart';
import 'package:intl/intl.dart';
import 'widgets/greeting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrap_it/pathsAndConsts.dart';

class TestHomeScreen extends StatefulWidget {
  @override
  _TestHomeScreenState createState() => _TestHomeScreenState();
}

class _TestHomeScreenState extends State<TestHomeScreen> {
  ApiService client = ApiService();

  final auth = FirebaseAuth.instance;

  @override
  void initState(){
    super.initState();

    getuser();
  }
  void getuser() async {
    final user = await auth.currentUser;
    if(user!=null){
      print(user.displayName);
      print(user.email);

    }
  }
  String greetingMes = greetingMessage();
  String date = DateFormat("EEEEE, yyyy-MM-dd").format(DateTime.now());
  String time = DateFormat("hh:mm a").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbardefault,
      body: Container(
        
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Align(alignment: Alignment.topLeft, 
            child: Text(
                greetingMes,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  fontSize: 28,
                  color: text_body,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(alignment: Alignment.topLeft, child: Text(date,
            style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'PTSans',
                  fontSize: 24,
                  color: text_body,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(alignment: Alignment.topLeft, child: Text(time,
            style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'PTSans',
                  fontSize: 20,
                  color: text_body,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Align(alignment: Alignment.topLeft, child: Text('Latest news on sustainability brought to you by Guardian',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'PTSans',
                fontSize: 18,
                color: text_body,
              ),
            ),
            ),
            Expanded(
              child: FutureBuilder(
                future: client.getArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.hasData) {
                    List<Article> articles = snapshot.data;
                    return ListView.builder(
                      itemCount: articles?.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
