import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:news/src/models/news_model.dart';
import 'package:news/src/models/category_model.dart';

final String _urlNews = 'https://newsapi.org/v2';
final String _apikey = 'f1d1b4ee2923463db24d61d6feba359d';

class NewProvider with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.heart, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewProvider() {
    this.getTopHeadlines();

    categories.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
  }

  getTopHeadlines() async {
    final url = Uri.parse('$_urlNews/top-headlines?country=co&apiKey=$_apikey');
    final request = await http.get(url);

    final newResponse = newsResponseFromJson(request.body);

    this.headlines.addAll(newResponse.articles);

    notifyListeners();
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory(String value) {
    this._selectedCategory = value;

    this.getArticlesByCategory(value);

    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      return this.categoryArticles[category];
    }

    final url = Uri.parse(
        '$_urlNews/top-headlines?country=co&apiKey=$_apikey&category=$category');
    final request = await http.get(url);

    final newResponse = newsResponseFromJson(request.body);

    this.categoryArticles[category].addAll(newResponse.articles);

    notifyListeners();
  }

  List<Article> get getArticlesCategorySelected =>
      this.categoryArticles[this.selectedCategory];
}
