import 'package:news/data/model/sources.dart';

class Article {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String? ?? "No title available",
      description: json['description'] as String? ?? "",
      url: json['url'] as String? ?? "",
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String? ?? "",
      content: json['content'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
