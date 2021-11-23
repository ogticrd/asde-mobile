import 'package:asde_app/models/news.dart';
import 'models/tourist_sites.dart';

class Singleton {
  static Future<List<News>> allNews = Future<List<News>>.value([]);
  static Future<List<TouristSite>> allTouristSites =
      Future<List<TouristSite>>.value([]);

  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
