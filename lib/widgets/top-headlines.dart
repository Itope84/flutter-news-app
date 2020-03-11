import 'package:flutter/material.dart';
import 'package:news_app/models/headline.dart';

class TopHeadlines extends StatelessWidget {
  List<Headline> headlines;
  TopHeadlines({@required this.headlines});

  @override
  Widget build(BuildContext context) {
    print(headlines);
    return ListView.builder(
      itemCount: headlines != null ? headlines.length : 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => topHeadlineCard(headlines[index]),
    );
  }

  Widget topHeadlineCard(Headline headline) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 170.0,
        width: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[300],
            image: headline.urlToImage != null
                ? DecorationImage(
                    image: NetworkImage(headline.urlToImage), fit: BoxFit.cover)
                : null),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromRGBO(0, 0, 0, 0.5), Colors.transparent]),
          ),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    headline.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
