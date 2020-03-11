import 'package:flutter/material.dart';
import 'package:news_app/bloc/news.dart';
import 'package:news_app/models/headline.dart';
import 'package:news_app/services/api.dart';

class MainBloc with ChangeNotifier, NewsBloc {
  List<Headline> _headlines;

  List<Headline> get headlines {
    return this._headlines ?? [];
  }

  Future<void> fetchHeadlines(String category) async {
    List<Headline> headlines =
        await ApiService.getHeadlines(category: category);

    this._headlines = headlines;

    print(this._headlines);

    notifyListeners();
  }
}
