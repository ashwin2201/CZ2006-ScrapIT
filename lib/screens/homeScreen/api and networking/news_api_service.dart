import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:convert' show utf8;

import 'article_model.dart';
import 'package:http/http.dart';
import '../../../pathsAndConsts.dart';

class ApiService {
  final endPointUrl = guardian_api_url;
  Future<List<Article>> getArticle() async {
    //Future<Text> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(res.bodyBytes));
      List<dynamic> body = json['response']['results'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the articles. Please try again later :(");
    }
  }
}
