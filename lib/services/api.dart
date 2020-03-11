import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/headline.dart';

class ApiService {
  static final String BASE_URL = DotEnv().env['API_BASE_URL'];
  static final String API_KEY = DotEnv().env['NEWS_API_KEY'];

  static Future<Map<String, dynamic>> get(String url,
      {Map<String, String> params}) async {
    String formattedParams = "";
    print(DotEnv().env);

    if (params != null) {
      params.forEach((key, val) => formattedParams += "&$key=$val");
    }

    http.Response response =
        await http.get(BASE_URL + url + '?apiKey=$API_KEY' + formattedParams);

    int statusCode = response.statusCode;

    switch (statusCode) {
      case 200:
      case 201:
        Map<String, dynamic> data = json.decode(response.body);
        return data;
        break;

      default:
        // TODO: handle 404s and other exceptions
        break;
    }
  }

  static Future<List<Headline>> getHeadlines({category}) async {
    Map<String, String> params = {"country": "ng"};
    if (category != null && category != 'all') {
      params['category'] = category;
    }
    Map<String, dynamic> response = await get('top-headlines', params: params);

    return Headline.fromJsonList(response['articles']);
  }
}
