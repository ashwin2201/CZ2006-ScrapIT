class Article {
  String title;
  String url;
  DateTime publishedDate;

  Article({required this.title, required this.url, required this.publishedDate});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['webTitle'] as String,
      url: json['webUrl'] as String,
      publishedDate: json['publishedDate'] as DateTime,
    );
  }
}
