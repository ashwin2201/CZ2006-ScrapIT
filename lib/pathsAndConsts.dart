import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const google_serp_api_url =
    'https://serpapi.com/search.json?q=environment&hl=en&gl=us&google_domain=google.com&tbm=nws&api_key=d76eb107841b2ae7b1306eb6bdbe60fe73fedb21b1706efb2fedd5f77164966f';
const news_api_url =
    'http://newsapi.org/v2/top-headlines?q=recycle&apiKey=602bde8ea97c4e72a8cebf0b04694b2b';
const guardian_api_url =
    'https://content.guardianapis.com/search?q=environment%20OR%20recycling&api-key=264990ed-d58c-427a-9022-2180b6e430d6&charset=utf';

const googleApiKey = 'AIzaSyBNTTeislDh-6Lf_Rm2hPqeq-oaZI-DFjM';

//Colors
Color bg_offwhite = Color.fromARGB(255, 239, 255, 226);
Color appbar_green = Colors.green;
Color text_heading = Colors.white;
Color text_body = Colors.black;

//Defualt App Bar
var appbardefault = AppBar(
  title: Text(
    "ScrapIT",
    style: TextStyle(
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      color: text_heading,
    ),
    textAlign: TextAlign.center,
  ),
  centerTitle: true,
  backgroundColor: appbar_green,
  toolbarHeight: 65,
);

//Text Size
