import 'package:news/data/model/artecles.dart';

class ArticleResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    var articlesList = json['articles'] as List;
    List<Article> articles =
        articlesList.map((i) => Article.fromJson(i)).toList();

    return ArticleResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: articles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }
}
