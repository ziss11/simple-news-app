class Article {
  final String? author;
  final String title;
  final String desc;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    required this.author,
    required this.title,
    required this.desc,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json['author'],
        title: json['title'],
        desc: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
      );
}
