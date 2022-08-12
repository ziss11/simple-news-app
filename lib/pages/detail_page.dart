import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_web.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail-page';

  final Article article;
  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Hero(
            tag: article.urlToImage!,
            child: Image.network(
              article.urlToImage!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  height: 3,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(article.desc),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  height: 3,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Date: ${article.publishedAt}'),
                const SizedBox(
                  height: 8,
                ),
                Text('Author: ${article.author}'),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  height: 3,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  article.content!,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    DetailWeb.routeName,
                    arguments: article.url,
                  ),
                  child: const Text('Read me'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
