import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Article {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return
      Article(
        source: json['source']['name']??"",
        author: json['author']??"",
        title: json['title']??"",
        description: json['description']??"",
        url: json['url']??"",
        urlToImage: json['urlToImage']??"",
        publishedAt: json['publishedAt']??"",
      );
  }
}

List<Article> parseArticles(String responseBody) {
  final res = jsonDecode(responseBody);
  final parsed = (res['articles'] as List);
  List<Article> output = [];
  for (final d in parsed) {
    output.add(Article.fromJson(d));
  }
  return output;
}

Future<List<Article>> fetchArticles(String? category) async {
  String? apiKey = dotenv.env['API_KEY'];
  final response = await http
      .get(
      Uri.parse('https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey'),);

  if (response.statusCode == 200) {
    return parseArticles(response.body);
  } else {
    throw Exception('Failed to load articles');
  }
}