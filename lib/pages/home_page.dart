import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/provider/news_notifier.dart';
import 'package:news_app/utils/result_state.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOS,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: _articleList(context),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _articleList(context),
    );
  }

  Widget _articleList(BuildContext context) {
    return Consumer<NewsNotifier>(
      builder: ((context, articles, _) {
        if (articles.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (articles.state == ResultState.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: articles.articles.length,
              itemBuilder: (context, idx) {
                return _articleTile(
                  context,
                  articles.articles[idx],
                );
              },
            );
          } else if (articles.state == ResultState.none) {
            return Center(
              child: Text(articles.message),
            );
          } else if (articles.state == ResultState.error) {
            return Center(
              child: Text(articles.message),
            );
          } else {
            return const SizedBox();
          }
        }
      }),
    );
  }

  InkWell _articleTile(BuildContext context, Article article) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        DetailPage.routeName,
        arguments: article,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: article.urlToImage!,
                child: Image.network(
                  article.urlToImage!,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    article.author!,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
