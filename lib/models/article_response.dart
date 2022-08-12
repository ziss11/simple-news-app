import 'package:news_app/models/article.dart';

class ArticleResponse {
  final List<Article> articleList;

  ArticleResponse({required this.articleList});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        articleList: List<Article>.from(
          (json["articles"] as List).map((x) => Article.fromJson(x)).where(
                (article) =>
                    article.author != null &&
                    article.urlToImage != null &&
                    article.publishedAt != null &&
                    article.content != null,
              ),
        ),
      );
}
