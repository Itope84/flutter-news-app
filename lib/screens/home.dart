import 'package:flutter/material.dart';
import 'package:news_app/bloc/index.dart';
import 'package:news_app/models/headline.dart';
import 'package:news_app/services/api.dart';
import 'package:news_app/widgets/category-list.dart';
import 'package:news_app/widgets/headlines.dart';
import 'package:news_app/widgets/top-headlines.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainBloc _bloc;
  bool _isInitialised = false, _fetchingHeadlines = false;

  Future<void> _fetchHeadlines({String category}) async {
    setState(() {
      _fetchingHeadlines = true;
    });
    await _bloc.fetchHeadlines(category);

    setState(() {
      _fetchingHeadlines = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialised) {
      setState(() {
        _bloc = Provider.of<MainBloc>(context);
      });
      _isInitialised = true;
    }

    // if we don't have headlines yet fetch them
    if ((_bloc.headlines == null || _bloc.headlines.length < 1) &&
        !_fetchingHeadlines) {
      _fetchHeadlines();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("News"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 50.0,
                child: CategoryList(
                  fetchHeadlines: _fetchHeadlines,
                ),
              ),
              Container(
                height: 200.0,
                child: TopHeadlines(
                  headlines: _bloc.headlines.take(5)?.toList(),
                ),
              ),
              Headlines(headlines: _bloc.headlines.skip(5).toList())
            ],
          ),
        ),
      ),
    );
  }
}
