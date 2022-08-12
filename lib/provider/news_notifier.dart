import 'package:flutter/cupertino.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/service/api_service.dart';
import 'package:news_app/utils/result_state.dart';

class NewsNotifier extends ChangeNotifier {
  final ApiService service;

  NewsNotifier({required this.service}) {
    _fetchAllArticles();
  }

  late List<Article> _articles;
  late String _message;
  late ResultState _state;

  List<Article> get articles => _articles;
  String get message => _message;
  ResultState get state => _state;

  Future _fetchAllArticles() async {
    _state = ResultState.loading;
    notifyListeners();

    final result = await service.topHealines();

    try {
      if (result.isNotEmpty) {
        _state = ResultState.hasData;
        notifyListeners();

        _articles = result;
      } else {
        _state = ResultState.none;
        notifyListeners();

        _message = 'Empty Data';
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();

      _message = e.toString();
    }
  }
}
