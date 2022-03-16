import 'package:scrap_it/pathsAndConsts.dart';

import '../api and networking/article_model.dart';
import 'package:flutter/material.dart';
import '../api and networking/html_open.dart';

Widget customListTile(Article article, BuildContext context) {
  HTML_redirect webData = HTML_redirect();
  return InkWell(
    onTap: () {
      webData.htmlOpenLink(article.url);
      //print(article.url);
    },
    child: Container(
       margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
       padding: EdgeInsets.all(8.0),
       decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}