import 'package:flutter/material.dart';
import 'package:news_app/models/headline.dart';
import 'package:news_app/theme/styles.dart';
import 'package:news_app/utils/strings.dart';

class Headlines extends StatelessWidget {
  List<Headline> headlines;
  Headlines({@required this.headlines});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe5e5e5e5),
      child: ListView.builder(
        itemCount: headlines.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => headlineCard(headlines[index]),
      ),
    );
  }

  Widget headlineCard(Headline headline) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 130.0,
            height: 150.0,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                headline.urlToImage ?? 'https://placeimg.com/640/480/any',
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                headline.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                headline.description ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: greyColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(readableDate(headline.publishedAt)),
            ],
          ))
        ],
      ),
    );
  }
}
