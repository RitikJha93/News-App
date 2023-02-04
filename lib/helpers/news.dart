import 'dart:convert';

import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];

  Future<void> getNews() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=a30e9d38a61a4321b3be8eb8a26ae6bc';

    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    print(jsonData);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsModel newsModel = NewsModel(
            title: article['title'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            content: article['content'],
          );
          news.add(newsModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<NewsModel> news = [];

  Future<void> getNews(String category) async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a30e9d38a61a4321b3be8eb8a26ae6bc';

    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    print(jsonData);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article['urlToImage'] != null && article['description'] != null) {
          NewsModel newsModel = NewsModel(
            title: article['title'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            content: article['content'],
          );
          news.add(newsModel);
        }
      });
    }
  }
}
