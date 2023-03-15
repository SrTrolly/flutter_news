import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/models.dart';
import "package:http/http.dart" as http;

class NewsService extends ChangeNotifier {
  // final String _URL_NEWS = "newsapi.org/v2/";
  // final String _API_KEY = "5eaf3ac9cd464c72912710baca8a22db";
  List<Article> headlines = [];
  String _selectedCategory = "business";

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyball, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    categories.forEach((element) {
      categoryArticles[element.name] = List<Article>.empty(growable: true);
    });
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getArticlesbyCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory]!;

  getTopHeadlines() async {
    final Uri uri = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'us', 'apiKey': '5eaf3ac9cd464c72912710baca8a22db'});
    final resp = await http.get(uri);

    final newResponse = NewsResponse.fromRawJson(resp.body);

    headlines.addAll(newResponse.articles);
    notifyListeners();
  }

  getArticlesbyCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final Uri uri = Uri.https('newsapi.org', '/v2/top-headlines', {
      'country': 'us',
      "category": category,
      'apiKey': '5eaf3ac9cd464c72912710baca8a22db'
    });
    final resp = await http.get(uri);

    final newResponse = NewsResponse.fromRawJson(resp.body);

    categoryArticles[category]!.addAll(newResponse.articles);

    notifyListeners();
  }
}
