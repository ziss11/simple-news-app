import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article.dart';
import 'package:news_app/models/article_response.dart';

class ApiService {
  final _basedUrl = "https://newsapi.org/v2/top-headlines";
  final _apiKey = "16ea1cf0bdab4f948e8e91d6307e5112";
  final _category = "business";
  final _country = "id";

  Future<List<Article>> topHealines() async {
    final response = await http.get(Uri.parse(
        "$_basedUrl?country=$_country&category=$_category&apiKey=$_apiKey"));

    if (response.statusCode == 200) {
      return ArticleResponse.fromJson(jsonDecode(response.body)).articleList;
    } else {
      throw Exception('Failed to get news data');
    }
  }
}
