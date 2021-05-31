import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapiexample/Models/news_info.dart';
class Api_Manager{
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c9038f605e5a419b98357ef361fcfa02'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

