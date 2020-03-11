import 'package:flutter/material.dart';
import 'package:news_app/utils/strings.dart';

class CategoryList extends StatelessWidget {
  Function fetchHeadlines;
  CategoryList({@required this.fetchHeadlines});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'business',
      'entertainment',
      'general',
      'health',
      'science',
      'sports',
      'technology'
    ];
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map((category) => FlatButton(
                  onPressed: () async {
                    await fetchHeadlines(category: category);
                  },
                  child: Text(capitalize(category)),
                  padding: EdgeInsets.all(10.0),
                ))
            .toList(),
      ),
    );
  }
}
