import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/routes.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/theme/styles.dart';

Future<void> main() async {
  DotEnv().load('.env');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      routes: routes,
      theme: appTheme,
      initialRoute: HomeScreen.routeName,
    );
  }
}
