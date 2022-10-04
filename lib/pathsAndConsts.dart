import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const google_serp_api_url =
    'https://serpapi.com/search.json?q=environment&hl=en&gl=us&google_domain=google.com&tbm=nws&api_key=';
const news_api_url =
    'http://newsapi.org/v2/top-headlines?q=recycle&apiKey=';
const guardian_api_url =
    'https://content.guardianapis.com/search?q=environment%20OR%20recycling&api-key=&charset=utf';

const googleApiKey = '';

//Colors
Color bg_offwhite = Color.fromARGB(255, 239, 255, 226);
Color appbar_green = Colors.green;
Color button_green = Colors.green;
Color text_heading = Colors.white;
Color text_body = Colors.black;

//Defualt App Bar
var appbardefault = AppBar(
  centerTitle: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        ("assets/Scrapit_logo.png"),
        height: 50,
        width: 50,
      ),
      Text(
        "  ScrapIT",
        style: TextStyle(
          fontFamily: 'Inter',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 34,
          color: text_heading,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  ),
  backgroundColor: appbar_green,
  toolbarHeight: 65,
);
