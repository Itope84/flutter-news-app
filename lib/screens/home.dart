import 'package:flutter/material.dart';
import 'package:news_app/widgets/category-list.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
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
                child: CategoryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
