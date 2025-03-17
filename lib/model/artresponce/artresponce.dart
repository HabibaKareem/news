import 'package:newsapp1/model/artresponce/article.dart';

class ArticleResponse {
  String status;
  String? code;
  String? message;
  int totalResults;
  List<Article> articles;

  ArticleResponse({
    required this.status,
    this.code,
    this.message,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}
